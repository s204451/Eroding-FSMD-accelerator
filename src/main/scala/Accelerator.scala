import chisel3._
import chisel3.util._

class Accelerator extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())

    val address = Output(UInt(16.W))
    val dataRead = Input(UInt(32.W))
    val writeEnable = Output(Bool())
    val dataWrite = Output(UInt(32.W))

  })

  //Write here your code
  //State enum and register
  val idle :: neighborAndSelf :: leftIsBlack :: rightIsBlack :: upperIsBlack :: lowerIsBlack :: whitenPixel :: blackenPixel :: done :: Nil = Enum(9)
  val stateReg = RegInit(idle)

  //Support registers
  val xReg = RegInit(0.U(5.W))
  val yReg = RegInit(0.U(5.W))

  //Default values
  io.address := 0.U
  io.writeEnable := false.B
  io.done := false.B
  io.dataWrite := false.B


  //FSMD switch
  switch(stateReg) {
    is(idle) {
      when(io.start) {
        stateReg := neighborAndSelf
        xReg := 0.U
      }
    }
//    is(firstFor) {
//      when(xReg <= 19.U) {
//        yReg := 0.U
//        stateReg := neighborAndSelf
//      }
//    }
    is(neighborAndSelf) {
      io.address := xReg + 20.U * yReg
      when (xReg === 20.U) {
        stateReg := done
      } .elsewhen(yReg === 20.U) {
        xReg := xReg + 1.U
        yReg := 0.U
        stateReg := neighborAndSelf
      } .elsewhen(xReg <= 19.U &&
                  yReg <= 19.U &&
                  (yReg === 0.U || yReg === 19.U || xReg === 0.U || xReg === 19.U || io.dataRead === 0.U)) {
        stateReg := blackenPixel
      } .otherwise {
        stateReg := leftIsBlack
      }
    }
    is(leftIsBlack) {
      io.address := xReg + 20.U * yReg - 1.U
      when(io.dataRead === 0.U) {
        stateReg := blackenPixel
      }.otherwise {
        stateReg := rightIsBlack
      }
    }
    is(rightIsBlack) {
      io.address := xReg + 20.U * yReg + 1.U
      when(io.dataRead === 0.U) {
        stateReg := blackenPixel
      }.otherwise {
        stateReg := upperIsBlack
      }
    }
    is(upperIsBlack) {
      io.address := xReg + 20.U * yReg - 20.U
      when(io.dataRead === 0.U) {
        stateReg := blackenPixel
      }.otherwise {
        stateReg := lowerIsBlack
      }
    }
    is(lowerIsBlack) {
      io.address := xReg + 20.U * yReg + 20.U
      when(io.dataRead === 0.U) {
        stateReg := blackenPixel
      }.otherwise {
        stateReg := whitenPixel
      }
    }
    is(whitenPixel) {
      io.address := xReg + 20.U * yReg + 400.U
      io.dataWrite := 255.U
      io.writeEnable := true.B
      yReg := yReg + 1.U
      stateReg := neighborAndSelf
    }
    is(blackenPixel) {
      io.address := xReg + 20.U * yReg + 400.U
      io.dataWrite := 0.U
      io.writeEnable := true.B
      yReg := yReg + 1.U
      stateReg := neighborAndSelf
    }
    is(done) {
      io.done := true.B
      stateReg := done
    }
  }
}