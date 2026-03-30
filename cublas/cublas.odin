//Generated using odin-c-bindgen
package cublas
import "core:c"
import "../cuda"

libraryPropertyType :: enum(c.int)
{
    MAJOR_VERSION,
    MINOR_VERSION,
    PATCH_LEVEL
}

cudaDataType :: enum(c.int) {
    CUDA_R_16F  =  2,
    CUDA_C_16F  =  6,
    CUDA_R_16BF = 14,
    CUDA_C_16BF = 15,
    CUDA_R_32F  =  0,
    CUDA_C_32F  =  4,
    CUDA_R_64F  =  1,
    CUDA_C_64F  =  5,
    CUDA_R_4I   = 16,
    CUDA_C_4I   = 17,
    CUDA_R_4U   = 18,
    CUDA_C_4U   = 19,
    CUDA_R_8I   =  3,
    CUDA_C_8I   =  7,
    CUDA_R_8U   =  8,
    CUDA_C_8U   =  9,
    CUDA_R_16I  = 20,
    CUDA_C_16I  = 21,
    CUDA_R_16U  = 22,
    CUDA_C_16U  = 23,
    CUDA_R_32I  = 10,
    CUDA_C_32I  = 11,
    CUDA_R_32U  = 12,
    CUDA_C_32U  = 13,
    CUDA_R_64I  = 24,
    CUDA_C_64I  = 25,
    CUDA_R_64U  = 26,
    CUDA_C_64U  = 27 
}

CUBLAS_VER_MAJOR :: 11
CUBLAS_VER_MINOR :: 7
CUBLAS_VER_PATCH :: 4
CUBLAS_VER_BUILD :: 6
CUBLAS_VERSION :: CUBLAS_VER_MAJOR * 1000 + CUBLAS_VER_MINOR * 100 + CUBLAS_VER_PATCH

cublasStatus :: enum c.int {
    SUCCESS          = 0,
    NOT_INITIALIZED  = 1,
    ALLOC_FAILED     = 3,
    INVALID_VALUE    = 7,
    ARCH_MISMATCH    = 8,
    MAPPING_ERROR    = 11,
    EXECUTION_FAILED = 13,
    INTERNAL_ERROR   = 14,
    NOT_SUPPORTED    = 15,
    LICENSE_ERROR    = 16,
}

cublasFillMode :: enum c.int {
    LOWER = 0,
    UPPER = 1,
    FULL  = 2,
}

cublasDiagType :: enum c.int {
    NON_UNIT = 0,
    UNIT     = 1,
}

cublasSideMode :: enum c.int {
    LEFT  = 0,
    RIGHT = 1,
}

cublasOperation :: enum c.int {
    N        = 0,
    T        = 1,
    C        = 2,
    HERMITAN = 2,
    CONJG    = 3,
}

cublasPointerMode :: enum c.int {
    HOST   = 0,
    DEVICE = 1,
}

cublasAtomicsMode :: enum c.int {
    NOT_ALLOWED = 0,
    ALLOWED     = 1,
}

cublasGemmAlgo :: enum c.int {
    DFALT             = -1,
    DEFAULT           = -1,
    ALGO0             = 0,
    ALGO1             = 1,
    ALGO2             = 2,
    ALGO3             = 3,
    ALGO4             = 4,
    ALGO5             = 5,
    ALGO6             = 6,
    ALGO7             = 7,
    ALGO8             = 8,
    ALGO9             = 9,
    ALGO10            = 10,
    ALGO11            = 11,
    ALGO12            = 12,
    ALGO13            = 13,
    ALGO14            = 14,
    ALGO15            = 15,
    ALGO16            = 16,
    ALGO17            = 17,
    ALGO18            = 18,
    ALGO19            = 19,
    ALGO20            = 20,
    ALGO21            = 21,
    ALGO22            = 22,
    ALGO23            = 23,
    DEFAULT_TENSOR_OP = 99,
    DFALT_TENSOR_OP   = 99,
    ALGO0_TENSOR_OP   = 100,
    ALGO1_TENSOR_OP   = 101,
    ALGO2_TENSOR_OP   = 102,
    ALGO3_TENSOR_OP   = 103,
    ALGO4_TENSOR_OP   = 104,
    ALGO5_TENSOR_OP   = 105,
    ALGO6_TENSOR_OP   = 106,
    ALGO7_TENSOR_OP   = 107,
    ALGO8_TENSOR_OP   = 108,
    ALGO9_TENSOR_OP   = 109,
    ALGO10_TENSOR_OP  = 110,
    ALGO11_TENSOR_OP  = 111,
    ALGO12_TENSOR_OP  = 112,
    ALGO13_TENSOR_OP  = 113,
    ALGO14_TENSOR_OP  = 114,
    ALGO15_TENSOR_OP  = 115,
}

cublasMath :: enum c.int {
    DEFAULT_MATH = 0,
    TENSOR_OP_MATH = 1,
    PEDANTIC_MATH = 2,
    TF32_TENSOR_OP_MATH = 3,
    MATH_DISALLOW_REDUCED_PRECISION_REDUCTION = 16,
}
cublasDataType :: cudaDataType
cublasComputeType :: enum c.int {
    _16F          = 64,
    _16F_PEDANTIC = 65,
    _32F          = 68,
    _32F_PEDANTIC = 69,
    _32F_FAST_16F = 74,
    _32F_FAST_16BF = 75,
    _32F_FAST_TF32 = 77,
    _64F          = 70,
    _64F_PEDANTIC = 71,
    _32I          = 72,
    _32I_PEDANTIC = 73,
}
cublasHandle :: distinct rawptr
cublasLogCallback :: proc "c" (cstring)

when (ODIN_OS == .Windows) {
    foreign import lib "system:libcublas.lib"
} else {
    foreign import lib "system:libcublas.so"
}

@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    cublasCreate_v2         :: proc(handle: ^cublasHandle) -> cublasStatus ---
    cublasDestroy_v2        :: proc(handle: cublasHandle) -> cublasStatus ---
    cublasGetVersion_v2     :: proc(handle: cublasHandle, version: ^c.int) -> cublasStatus ---
    cublasGetProperty       :: proc(type: libraryPropertyType, value: ^c.int) -> cublasStatus ---
    cublasGetCudartVersion  :: proc() -> c.size_t ---
    cublasSetWorkspace_v2   :: proc(handle: cublasHandle, workspace: rawptr, workspaceSizeInBytes: c.size_t) -> cublasStatus ---
    cublasSetStream_v2      :: proc(handle: cublasHandle, streamId: cuda.CUstream) -> cublasStatus ---
    cublasGetStream_v2      :: proc(handle: cublasHandle, streamId: ^cuda.CUstream) -> cublasStatus ---
    cublasGetPointerMode_v2 :: proc(handle: cublasHandle, mode: ^cublasPointerMode) -> cublasStatus ---
    cublasSetPointerMode_v2 :: proc(handle: cublasHandle, mode: cublasPointerMode) -> cublasStatus ---
    cublasGetAtomicsMode    :: proc(handle: cublasHandle, mode: ^cublasAtomicsMode) -> cublasStatus ---
    cublasSetAtomicsMode    :: proc(handle: cublasHandle, mode: cublasAtomicsMode) -> cublasStatus ---
    cublasGetMathMode       :: proc(handle: cublasHandle, mode: ^cublasMath) -> cublasStatus ---
    cublasSetMathMode       :: proc(handle: cublasHandle, mode: cublasMath) -> cublasStatus ---
    cublasGetSmCountTarget  :: proc(handle: cublasHandle, smCountTarget: ^c.int) -> cublasStatus ---
    cublasSetSmCountTarget  :: proc(handle: cublasHandle, smCountTarget: c.int) -> cublasStatus ---
    cublasGetStatusName     :: proc(status: cublasStatus) -> cstring ---
    cublasGetStatusString   :: proc(status: cublasStatus) -> cstring ---
    cublasLoggerConfigure   :: proc(logIsOn: c.int, logToStdOut: c.int, logToStdErr: c.int, logFileName: cstring) -> cublasStatus ---
    cublasSetLoggerCallback :: proc(userCallback: cublasLogCallback) -> cublasStatus ---
    cublasGetLoggerCallback :: proc(userCallback: cublasLogCallback) -> cublasStatus ---
    cublasSetVector :: proc(n: c.int, elemSize: c.int, x: rawptr, incx: c.int, devicePtr: rawptr, incy: c.int) -> cublasStatus ---
    cublasGetVector :: proc(n: c.int, elemSize: c.int, x: rawptr, incx: c.int, y: rawptr, incy: c.int) -> cublasStatus ---
    cublasSetMatrix :: proc(rows: c.int, cols: c.int, elemSize: c.int, A: rawptr, lda: c.int, B: rawptr, ldb: c.int) -> cublasStatus ---
    cublasGetMatrix :: proc(rows: c.int, cols: c.int, elemSize: c.int, A: rawptr, lda: c.int, B: rawptr, ldb: c.int) -> cublasStatus ---
    cublasSetVectorAsync :: proc(n: c.int, elemSize: c.int, hostPtr: rawptr, incx: c.int, devicePtr: rawptr, incy: c.int, stream: cuda.CUstream) -> cublasStatus ---
    cublasGetVectorAsync :: proc(n: c.int, elemSize: c.int, devicePtr: rawptr, incx: c.int, hostPtr: rawptr, incy: c.int, stream: cuda.CUstream) -> cublasStatus ---
    cublasSetMatrixAsync :: proc(rows: c.int, cols: c.int, elemSize: c.int, A: rawptr, lda: c.int, B: rawptr, ldb: c.int, stream: cuda.CUstream) -> cublasStatus ---
    cublasGetMatrixAsync :: proc(rows: c.int, cols: c.int, elemSize: c.int, A: rawptr, lda: c.int, B: rawptr, ldb: c.int, stream: cuda.CUstream) -> cublasStatus ---
    cublasXerbla         :: proc(srName: cstring, info: c.int) ---
    cublasNrm2Ex    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, result: rawptr, resultType: cudaDataType, executionType: cudaDataType) -> cublasStatus ---
    cublasSnrm2_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, result: ^f32) -> cublasStatus ---
    cublasDnrm2_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, result: ^f64) -> cublasStatus ---
    cublasScnrm2_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, result: ^f32) -> cublasStatus ---
    cublasDznrm2_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, result: ^f64) -> cublasStatus ---
    cublasDotEx     :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int, result: rawptr, resultType: cudaDataType, executionType: cudaDataType) -> cublasStatus ---
    cublasDotcEx    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int, result: rawptr, resultType: cudaDataType, executionType: cudaDataType) -> cublasStatus ---
    cublasSdot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, y: ^f32, incy: c.int, result: ^f32) -> cublasStatus ---
    cublasDdot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, y: ^f64, incy: c.int, result: ^f64) -> cublasStatus ---
    cublasCdotu_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, result: ^cuda.cuComplex) -> cublasStatus ---
    cublasCdotc_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, result: ^cuda.cuComplex) -> cublasStatus ---
    cublasZdotu_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, result: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasZdotc_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, result: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasScalEx    :: proc(handle: cublasHandle, n: c.int, alpha: rawptr, alphaType: cudaDataType, x: rawptr, xType: cudaDataType, incx: c.int, executionType: cudaDataType) -> cublasStatus ---
    cublasSscal_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^f32, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDscal_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^f64, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCscal_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasCsscal_v2 :: proc(handle: cublasHandle, n: c.int, alpha: ^f32, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZscal_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasZdscal_v2 :: proc(handle: cublasHandle, n: c.int, alpha: ^f64, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasAxpyEx    :: proc(handle: cublasHandle, n: c.int, alpha: rawptr, alphaType: cudaDataType, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int, executiontype: cudaDataType) -> cublasStatus ---
    cublasSaxpy_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDaxpy_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCaxpy_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZaxpy_v2  :: proc(handle: cublasHandle, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasCopyEx    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int) -> cublasStatus ---
    cublasScopy_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDcopy_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCcopy_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZcopy_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSswap_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDswap_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCswap_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZswap_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSwapEx    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int) -> cublasStatus ---
    cublasIsamax_v2 :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIdamax_v2 :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIcamax_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIzamax_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIamaxEx   :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIsamin_v2 :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIdamin_v2 :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIcamin_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIzamin_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasIaminEx   :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, result: ^c.int) -> cublasStatus ---
    cublasAsumEx    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, result: rawptr, resultType: cudaDataType, executiontype: cudaDataType) -> cublasStatus ---
    cublasSasum_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, result: ^f32) -> cublasStatus ---
    cublasDasum_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, result: ^f64) -> cublasStatus ---
    cublasScasum_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, result: ^f32) -> cublasStatus ---
    cublasDzasum_v2 :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, result: ^f64) -> cublasStatus ---
    cublasSrot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, y: ^f32, incy: c.int, _c: ^f32, s: ^f32) -> cublasStatus ---
    cublasDrot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, y: ^f64, incy: c.int, _c: ^f64, s: ^f64) -> cublasStatus ---
    cublasCrot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, _c: ^f32, s: ^cuda.cuComplex) -> cublasStatus ---
    cublasCsrot_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, _c: ^f32, s: ^f32) -> cublasStatus ---
    cublasZrot_v2   :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, _c: ^f64, s: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasZdrot_v2  :: proc(handle: cublasHandle, n: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, _c: ^f64, s: ^f64) -> cublasStatus ---
    cublasRotEx     :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int, _c: rawptr, s: rawptr, csType: cudaDataType, executiontype: cudaDataType) -> cublasStatus ---
    cublasSrotg_v2  :: proc(handle: cublasHandle, a: ^f32, b: ^f32, _c: ^f32, s: ^f32) -> cublasStatus ---
    cublasDrotg_v2  :: proc(handle: cublasHandle, a: ^f64, b: ^f64, _c: ^f64, s: ^f64) -> cublasStatus ---
    cublasCrotg_v2  :: proc(handle: cublasHandle, a: ^cuda.cuComplex, b: ^cuda.cuComplex, _c: ^f32, s: ^cuda.cuComplex) -> cublasStatus ---
    cublasZrotg_v2  :: proc(handle: cublasHandle, a: ^cuda.cuDoubleComplex, b: ^cuda.cuDoubleComplex, _c: ^f64, s: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasRotgEx    :: proc(handle: cublasHandle, a: rawptr, b: rawptr, abType: cudaDataType, _c: rawptr, s: rawptr, csType: cudaDataType, executiontype: cudaDataType) -> cublasStatus ---
    cublasSrotm_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f32, incx: c.int, y: ^f32, incy: c.int, param: ^f32) -> cublasStatus ---
    cublasDrotm_v2  :: proc(handle: cublasHandle, n: c.int, x: ^f64, incx: c.int, y: ^f64, incy: c.int, param: ^f64) -> cublasStatus ---
    cublasRotmEx    :: proc(handle: cublasHandle, n: c.int, x: rawptr, xType: cudaDataType, incx: c.int, y: rawptr, yType: cudaDataType, incy: c.int, param: rawptr, paramType: cudaDataType, executiontype: cudaDataType) -> cublasStatus ---
    cublasSrotmg_v2 :: proc(handle: cublasHandle, d1: ^f32, d2: ^f32, x1: ^f32, y1: ^f32, param: ^f32) -> cublasStatus ---
    cublasDrotmg_v2 :: proc(handle: cublasHandle, d1: ^f64, d2: ^f64, x1: ^f64, y1: ^f64, param: ^f64) -> cublasStatus ---
    cublasRotmgEx   :: proc(handle: cublasHandle, d1: rawptr, d1Type: cudaDataType, d2: rawptr, d2Type: cudaDataType, x1: rawptr, x1Type: cudaDataType, y1: rawptr, y1Type: cudaDataType, param: rawptr, paramType: cudaDataType, executiontype: cudaDataType) -> cublasStatus ---
    cublasSgemv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, x: ^f32, incx: c.int, beta: ^f32, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDgemv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, x: ^f64, incx: c.int, beta: ^f64, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCgemv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZgemv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSgbmv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, kl: c.int, ku: c.int, alpha: ^f32, A: ^f32, lda: c.int, x: ^f32, incx: c.int, beta: ^f32, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDgbmv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, kl: c.int, ku: c.int, alpha: ^f64, A: ^f64, lda: c.int, x: ^f64, incx: c.int, beta: ^f64, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCgbmv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, kl: c.int, ku: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZgbmv_v2 :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, kl: c.int, ku: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasStrmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^f32, lda: c.int, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtrmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^f64, lda: c.int, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtrmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtrmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasStbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^f32, lda: c.int, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^f64, lda: c.int, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasStpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^f32, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^f64, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasStrsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^f32, lda: c.int, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtrsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^f64, lda: c.int, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtrsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtrsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasStpsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^f32, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtpsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^f64, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtpsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtpsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, AP: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasStbsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^f32, lda: c.int, x: ^f32, incx: c.int) -> cublasStatus ---
    cublasDtbsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^f64, lda: c.int, x: ^f64, incx: c.int) -> cublasStatus ---
    cublasCtbsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int) -> cublasStatus ---
    cublasZtbsv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, n: c.int, k: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int) -> cublasStatus ---
    cublasSsymv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, x: ^f32, incx: c.int, beta: ^f32, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDsymv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, x: ^f64, incx: c.int, beta: ^f64, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasCsymv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZsymv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasChemv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZhemv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSsbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, x: ^f32, incx: c.int, beta: ^f32, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDsbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, x: ^f64, incx: c.int, beta: ^f64, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasChbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZhbmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSspmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, AP: ^f32, x: ^f32, incx: c.int, beta: ^f32, y: ^f32, incy: c.int) -> cublasStatus ---
    cublasDspmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, AP: ^f64, x: ^f64, incx: c.int, beta: ^f64, y: ^f64, incy: c.int) -> cublasStatus ---
    cublasChpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, AP: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, beta: ^cuda.cuComplex, y: ^cuda.cuComplex, incy: c.int) -> cublasStatus ---
    cublasZhpmv_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, AP: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, beta: ^cuda.cuDoubleComplex, y: ^cuda.cuDoubleComplex, incy: c.int) -> cublasStatus ---
    cublasSger_v2  :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, y: ^f32, incy: c.int, A: ^f32, lda: c.int) -> cublasStatus ---
    cublasDger_v2  :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, y: ^f64, incy: c.int, A: ^f64, lda: c.int) -> cublasStatus ---
    cublasCgeru_v2 :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasCgerc_v2 :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZgeru_v2 :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasZgerc_v2 :: proc(handle: cublasHandle, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasSsyr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, A: ^f32, lda: c.int) -> cublasStatus ---
    cublasDsyr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, A: ^f64, lda: c.int) -> cublasStatus ---
    cublasCsyr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZsyr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasCher_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^cuda.cuComplex, incx: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZher_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^cuda.cuDoubleComplex, incx: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasSspr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, AP: ^f32) -> cublasStatus ---
    cublasDspr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, AP: ^f64) -> cublasStatus ---
    cublasChpr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^cuda.cuComplex, incx: c.int, AP: ^cuda.cuComplex) -> cublasStatus ---
    cublasZhpr_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^cuda.cuDoubleComplex, incx: c.int, AP: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasSsyr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, y: ^f32, incy: c.int, A: ^f32, lda: c.int) -> cublasStatus ---
    cublasDsyr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, y: ^f64, incy: c.int, A: ^f64, lda: c.int) -> cublasStatus ---
    cublasCsyr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZsyr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasCher2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZher2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasSspr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f32, x: ^f32, incx: c.int, y: ^f32, incy: c.int, AP: ^f32) -> cublasStatus ---
    cublasDspr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^f64, x: ^f64, incx: c.int, y: ^f64, incy: c.int, AP: ^f64) -> cublasStatus ---
    cublasChpr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuComplex, x: ^cuda.cuComplex, incx: c.int, y: ^cuda.cuComplex, incy: c.int, AP: ^cuda.cuComplex) -> cublasStatus ---
    cublasZhpr2_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, alpha: ^cuda.cuDoubleComplex, x: ^cuda.cuDoubleComplex, incx: c.int, y: ^cuda.cuDoubleComplex, incy: c.int, AP: ^cuda.cuDoubleComplex) -> cublasStatus ---
    cublasSgemm_v2  :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int, beta: ^f32, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDgemm_v2  :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int, beta: ^f64, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCgemm_v2  :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasCgemm3m   :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasCgemm3mEx :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: rawptr, Atype: cudaDataType, lda: c.int, B: rawptr, Btype: cudaDataType, ldb: c.int, beta: ^cuda.cuComplex, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasZgemm_v2  :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasZgemm3m   :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasSgemmEx :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f32, A: rawptr, Atype: cudaDataType, lda: c.int, B: rawptr, Btype: cudaDataType, ldb: c.int, beta: ^f32, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasGemmEx  :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: rawptr, A: rawptr, Atype: cudaDataType, lda: c.int, B: rawptr, Btype: cudaDataType, ldb: c.int, beta: rawptr, C: rawptr, Ctype: cudaDataType, ldc: c.int, computeType: cublasComputeType, algo: cublasGemmAlgo) -> cublasStatus ---
    cublasCgemmEx       :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: rawptr, Atype: cudaDataType, lda: c.int, B: rawptr, Btype: cudaDataType, ldb: c.int, beta: ^cuda.cuComplex, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasUint8gemmBias :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, transc: cublasOperation, m: c.int, n: c.int, k: c.int, A: ^c.uchar, A_bias: c.int, lda: c.int, B: ^c.uchar, B_bias: c.int, ldb: c.int, C: ^c.uchar, C_bias: c.int, ldc: c.int, C_mult: c.int, C_shift: c.int) -> cublasStatus ---
    cublasSsyrk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, beta: ^f32, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDsyrk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, beta: ^f64, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCsyrk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZsyrk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasCsyrkEx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: rawptr, Atype: cudaDataType, lda: c.int, beta: ^cuda.cuComplex, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasCsyrk3mEx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: rawptr, Atype: cudaDataType, lda: c.int, beta: ^cuda.cuComplex, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasCherk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: ^cuda.cuComplex, lda: c.int, beta: ^f32, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZherk_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f64, A: ^cuda.cuDoubleComplex, lda: c.int, beta: ^f64, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasCherkEx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: rawptr, Atype: cudaDataType, lda: c.int, beta: ^f32, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasCherk3mEx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: rawptr, Atype: cudaDataType, lda: c.int, beta: ^f32, C: rawptr, Ctype: cudaDataType, ldc: c.int) -> cublasStatus ---
    cublasSsyr2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int, beta: ^f32, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDsyr2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int, beta: ^f64, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCsyr2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZsyr2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasCher2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^f32, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZher2k_v2 :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^f64, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasSsyrkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int, beta: ^f32, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDsyrkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int, beta: ^f64, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCsyrkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZsyrkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasCherkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^f32, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZherkx :: proc(handle: cublasHandle, uplo: cublasFillMode, trans: cublasOperation, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^f64, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasSsymm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int, beta: ^f32, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDsymm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int, beta: ^f64, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCsymm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZsymm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasChemm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZhemm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasStrsm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int) -> cublasStatus ---
    cublasDtrsm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int) -> cublasStatus ---
    cublasCtrsm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int) -> cublasStatus ---
    cublasZtrsm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int) -> cublasStatus ---
    cublasStrmm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, B: ^f32, ldb: c.int, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDtrmm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, B: ^f64, ldb: c.int, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCtrmm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, B: ^cuda.cuComplex, ldb: c.int, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZtrmm_v2 :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, B: ^cuda.cuDoubleComplex, ldb: c.int, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasSgemmBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f32, Aarray: ^^f32, lda: c.int, Barray: ^^f32, ldb: c.int, beta: ^f32, Carray: ^^f32, ldc: c.int, batchCount: c.int) -> cublasStatus ---
    cublasDgemmBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f64, Aarray: ^^f64, lda: c.int, Barray: ^^f64, ldb: c.int, beta: ^f64, Carray: ^^f64, ldc: c.int, batchCount: c.int) -> cublasStatus ---
    cublasCgemmBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, Aarray: ^^cuda.cuComplex, lda: c.int, Barray: ^^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, Carray: ^^cuda.cuComplex, ldc: c.int, batchCount: c.int) -> cublasStatus ---
    cublasCgemm3mBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, Aarray: ^^cuda.cuComplex, lda: c.int, Barray: ^^cuda.cuComplex, ldb: c.int, beta: ^cuda.cuComplex, Carray: ^^cuda.cuComplex, ldc: c.int, batchCount: c.int) -> cublasStatus ---
    cublasZgemmBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, Aarray: ^^cuda.cuDoubleComplex, lda: c.int, Barray: ^^cuda.cuDoubleComplex, ldb: c.int, beta: ^cuda.cuDoubleComplex, Carray: ^^cuda.cuDoubleComplex, ldc: c.int, batchCount: c.int) -> cublasStatus ---
    cublasGemmBatchedEx :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: rawptr, Aarray: ^rawptr, Atype: cudaDataType, lda: c.int, Barray: ^rawptr, Btype: cudaDataType, ldb: c.int, beta: rawptr, Carray: ^rawptr, Ctype: cudaDataType, ldc: c.int, batchCount: c.int, computeType: cublasComputeType, algo: cublasGemmAlgo) -> cublasStatus ---
    cublasGemmStridedBatchedEx :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: rawptr, A: rawptr, Atype: cudaDataType, lda: c.int, strideA: c.longlong, B: rawptr, Btype: cudaDataType, ldb: c.int, strideB: c.longlong, beta: rawptr, C: rawptr, Ctype: cudaDataType, ldc: c.int, strideC: c.longlong, batchCount: c.int, computeType: cublasComputeType, algo: cublasGemmAlgo) -> cublasStatus ---
    cublasSgemmStridedBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f32, A: ^f32, lda: c.int, strideA: c.longlong, B: ^f32, ldb: c.int, strideB: c.longlong, beta: ^f32, C: ^f32, ldc: c.int, strideC: c.longlong, batchCount: c.int) -> cublasStatus ---
    cublasDgemmStridedBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^f64, A: ^f64, lda: c.int, strideA: c.longlong, B: ^f64, ldb: c.int, strideB: c.longlong, beta: ^f64, C: ^f64, ldc: c.int, strideC: c.longlong, batchCount: c.int) -> cublasStatus ---
    cublasCgemmStridedBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, strideA: c.longlong, B: ^cuda.cuComplex, ldb: c.int, strideB: c.longlong, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int, strideC: c.longlong, batchCount: c.int) -> cublasStatus ---
    cublasCgemm3mStridedBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, strideA: c.longlong, B: ^cuda.cuComplex, ldb: c.int, strideB: c.longlong, beta: ^cuda.cuComplex, C: ^cuda.cuComplex, ldc: c.int, strideC: c.longlong, batchCount: c.int) -> cublasStatus ---
    cublasZgemmStridedBatched :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, k: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, strideA: c.longlong, B: ^cuda.cuDoubleComplex, ldb: c.int, strideB: c.longlong, beta: ^cuda.cuDoubleComplex, C: ^cuda.cuDoubleComplex, ldc: c.int, strideC: c.longlong, batchCount: c.int) -> cublasStatus ---
    cublasSgeam :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, alpha: ^f32, A: ^f32, lda: c.int, beta: ^f32, B: ^f32, ldb: c.int, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDgeam :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, alpha: ^f64, A: ^f64, lda: c.int, beta: ^f64, B: ^f64, ldb: c.int, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCgeam :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int, beta: ^cuda.cuComplex, B: ^cuda.cuComplex, ldb: c.int, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZgeam :: proc(handle: cublasHandle, transa: cublasOperation, transb: cublasOperation, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int, beta: ^cuda.cuDoubleComplex, B: ^cuda.cuDoubleComplex, ldb: c.int, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasSgetrfBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f32, lda: c.int, P: ^c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDgetrfBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f64, lda: c.int, P: ^c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCgetrfBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuComplex, lda: c.int, P: ^c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZgetrfBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuDoubleComplex, lda: c.int, P: ^c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasSgetriBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f32, lda: c.int, P: ^c.int, C: ^^f32, ldc: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDgetriBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f64, lda: c.int, P: ^c.int, C: ^^f64, ldc: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCgetriBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuComplex, lda: c.int, P: ^c.int, C: ^^cuda.cuComplex, ldc: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZgetriBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuDoubleComplex, lda: c.int, P: ^c.int, C: ^^cuda.cuDoubleComplex, ldc: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasSgetrsBatched :: proc(handle: cublasHandle, trans: cublasOperation, n: c.int, nrhs: c.int, Aarray: ^^f32, lda: c.int, devIpiv: ^c.int, Barray: ^^f32, ldb: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDgetrsBatched :: proc(handle: cublasHandle, trans: cublasOperation, n: c.int, nrhs: c.int, Aarray: ^^f64, lda: c.int, devIpiv: ^c.int, Barray: ^^f64, ldb: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCgetrsBatched :: proc(handle: cublasHandle, trans: cublasOperation, n: c.int, nrhs: c.int, Aarray: ^^cuda.cuComplex, lda: c.int, devIpiv: ^c.int, Barray: ^^cuda.cuComplex, ldb: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZgetrsBatched :: proc(handle: cublasHandle, trans: cublasOperation, n: c.int, nrhs: c.int, Aarray: ^^cuda.cuDoubleComplex, lda: c.int, devIpiv: ^c.int, Barray: ^^cuda.cuDoubleComplex, ldb: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasStrsmBatched :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f32, A: ^^f32, lda: c.int, B: ^^f32, ldb: c.int, batchCount: c.int) -> cublasStatus ---
    cublasDtrsmBatched :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^f64, A: ^^f64, lda: c.int, B: ^^f64, ldb: c.int, batchCount: c.int) -> cublasStatus ---
    cublasCtrsmBatched :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuComplex, A: ^^cuda.cuComplex, lda: c.int, B: ^^cuda.cuComplex, ldb: c.int, batchCount: c.int) -> cublasStatus ---
    cublasZtrsmBatched :: proc(handle: cublasHandle, side: cublasSideMode, uplo: cublasFillMode, trans: cublasOperation, diag: cublasDiagType, m: c.int, n: c.int, alpha: ^cuda.cuDoubleComplex, A: ^^cuda.cuDoubleComplex, lda: c.int, B: ^^cuda.cuDoubleComplex, ldb: c.int, batchCount: c.int) -> cublasStatus ---
    cublasSmatinvBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f32, lda: c.int, Ainv: ^^f32, lda_inv: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDmatinvBatched :: proc(handle: cublasHandle, n: c.int, A: ^^f64, lda: c.int, Ainv: ^^f64, lda_inv: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCmatinvBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuComplex, lda: c.int, Ainv: ^^cuda.cuComplex, lda_inv: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZmatinvBatched :: proc(handle: cublasHandle, n: c.int, A: ^^cuda.cuDoubleComplex, lda: c.int, Ainv: ^^cuda.cuDoubleComplex, lda_inv: c.int, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasSgeqrfBatched :: proc(handle: cublasHandle, m: c.int, n: c.int, Aarray: ^^f32, lda: c.int, TauArray: ^^f32, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDgeqrfBatched :: proc(handle: cublasHandle, m: c.int, n: c.int, Aarray: ^^f64, lda: c.int, TauArray: ^^f64, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCgeqrfBatched :: proc(handle: cublasHandle, m: c.int, n: c.int, Aarray: ^^cuda.cuComplex, lda: c.int, TauArray: ^^cuda.cuComplex, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZgeqrfBatched :: proc(handle: cublasHandle, m: c.int, n: c.int, Aarray: ^^cuda.cuDoubleComplex, lda: c.int, TauArray: ^^cuda.cuDoubleComplex, info: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasSgelsBatched :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, nrhs: c.int, Aarray: ^^f32, lda: c.int, Carray: ^^f32, ldc: c.int, info: ^c.int, devInfoArray: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasDgelsBatched :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, nrhs: c.int, Aarray: ^^f64, lda: c.int, Carray: ^^f64, ldc: c.int, info: ^c.int, devInfoArray: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasCgelsBatched :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, nrhs: c.int, Aarray: ^^cuda.cuComplex, lda: c.int, Carray: ^^cuda.cuComplex, ldc: c.int, info: ^c.int, devInfoArray: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasZgelsBatched :: proc(handle: cublasHandle, trans: cublasOperation, m: c.int, n: c.int, nrhs: c.int, Aarray: ^^cuda.cuDoubleComplex, lda: c.int, Carray: ^^cuda.cuDoubleComplex, ldc: c.int, info: ^c.int, devInfoArray: ^c.int, batchSize: c.int) -> cublasStatus ---
    cublasSdgmm :: proc(handle: cublasHandle, mode: cublasSideMode, m: c.int, n: c.int, A: ^f32, lda: c.int, x: ^f32, incx: c.int, C: ^f32, ldc: c.int) -> cublasStatus ---
    cublasDdgmm :: proc(handle: cublasHandle, mode: cublasSideMode, m: c.int, n: c.int, A: ^f64, lda: c.int, x: ^f64, incx: c.int, C: ^f64, ldc: c.int) -> cublasStatus ---
    cublasCdgmm :: proc(handle: cublasHandle, mode: cublasSideMode, m: c.int, n: c.int, A: ^cuda.cuComplex, lda: c.int, x: ^cuda.cuComplex, incx: c.int, C: ^cuda.cuComplex, ldc: c.int) -> cublasStatus ---
    cublasZdgmm :: proc(handle: cublasHandle, mode: cublasSideMode, m: c.int, n: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, x: ^cuda.cuDoubleComplex, incx: c.int, C: ^cuda.cuDoubleComplex, ldc: c.int) -> cublasStatus ---
    cublasStpttr :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, AP: ^f32, A: ^f32, lda: c.int) -> cublasStatus ---
    cublasDtpttr :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, AP: ^f64, A: ^f64, lda: c.int) -> cublasStatus ---
    cublasCtpttr :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, AP: ^cuda.cuComplex, A: ^cuda.cuComplex, lda: c.int) -> cublasStatus ---
    cublasZtpttr :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, AP: ^cuda.cuDoubleComplex, A: ^cuda.cuDoubleComplex, lda: c.int) -> cublasStatus ---
    cublasStrttp :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, A: ^f32, lda: c.int, AP: ^f32) -> cublasStatus ---
    cublasDtrttp :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, A: ^f64, lda: c.int, AP: ^f64) -> cublasStatus ---
    cublasCtrttp :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, A: ^cuda.cuComplex, lda: c.int, AP: ^cuda.cuComplex) -> cublasStatus ---
    cublasZtrttp :: proc(handle: cublasHandle, uplo: cublasFillMode, n: c.int, A: ^cuda.cuDoubleComplex, lda: c.int, AP: ^cuda.cuDoubleComplex) -> cublasStatus ---
}
