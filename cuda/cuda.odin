package cuda

import "core:io"
import "core:fmt"
import "core:c"
import "core:sys/linux"

MAX_CLOCK_TS :: 3

cuComplex :: [2]f32
cuDoubleComplex :: [2]f64

CUresult :: enum(c.int) {
    SUCCESS                              = 0,
    ERROR_INVALID_VALUE                  = 1,
    ERROR_OUT_OF_MEMORY                  = 2,
    ERROR_NOT_INITIALIZED                = 3,
    ERROR_DEINITIALIZED                  = 4,
    ERROR_PROFILER_DISABLED              = 5,
    ERROR_PROFILER_NOT_INITIALIZED       = 6,
    ERROR_PROFILER_ALREADY_STARTED       = 7,
    ERROR_PROFILER_ALREADY_STOPPED       = 8,
    ERROR_STUB_LIBRARY                   = 34,
    ERROR_NO_DEVICE                      = 100,
    ERROR_INVALID_DEVICE                 = 101,
    ERROR_DEVICE_NOT_LICENSED            = 102,
    ERROR_INVALID_IMAGE                  = 200,
    ERROR_INVALID_CONTEXT                = 201,
    ERROR_CONTEXT_ALREADY_CURRENT        = 202,
    ERROR_MAP_FAILED                     = 205,
    ERROR_UNMAP_FAILED                   = 206,
    ERROR_ARRAY_IS_MAPPED                = 207,
    ERROR_ALREADY_MAPPED                 = 208,
    ERROR_NO_BINARY_FOR_GPU              = 209,
    ERROR_ALREADY_ACQUIRED               = 210,
    ERROR_NOT_MAPPED                     = 211,
    ERROR_NOT_MAPPED_AS_ARRAY            = 212,
    ERROR_NOT_MAPPED_AS_POINTER          = 213,
    ERROR_ECC_UNCORRECTABLE              = 214,
    ERROR_UNSUPPORTED_LIMIT              = 215,
    ERROR_CONTEXT_ALREADY_IN_USE         = 216,
    ERROR_PEER_ACCESS_UNSUPPORTED        = 217,
    ERROR_INVALID_PTX                    = 218,
    ERROR_INVALID_GRAPHICS_CONTEXT       = 219,
    ERROR_NVLINK_UNCORRECTABLE           = 220,
    ERROR_JIT_COMPILER_NOT_FOUND         = 221,
    ERROR_UNSUPPORTED_PTX_VERSION        = 222,
    ERROR_JIT_COMPILATION_DISABLED       = 223,
    ERROR_UNSUPPORTED_EXEC_AFFINITY      = 224,
    ERROR_INVALID_SOURCE                 = 300,
    ERROR_FILE_NOT_FOUND                 = 301,
    ERROR_SHARED_OBJECT_SYMBOL_NOT_FOUND = 302,
    ERROR_SHARED_OBJECT_INIT_FAILED      = 303,
    ERROR_OPERATING_SYSTEM               = 304,
    ERROR_INVALID_HANDLE                 = 400,
    ERROR_ILLEGAL_STATE                  = 401,
    ERROR_NOT_FOUND                      = 500,
    ERROR_NOT_READY                      = 600,
    ERROR_ILLEGAL_ADDRESS                = 700,
    ERROR_LAUNCH_OUT_OF_RESOURCES        = 701,
    ERROR_LAUNCH_TIMEOUT                 = 702,
    ERROR_LAUNCH_INCOMPATIBLE_TEXTURING  = 703,
    ERROR_PEER_ACCESS_ALREADY_ENABLED    = 704,
    ERROR_PEER_ACCESS_NOT_ENABLED        = 705,
    ERROR_PRIMARY_CONTEXT_ACTIVE         = 708,
    ERROR_CONTEXT_IS_DESTROYED           = 709,
    ERROR_ASSERT                         = 710,
    ERROR_TOO_MANY_PEERS                 = 711,
    ERROR_HOST_MEMORY_ALREADY_REGISTERED = 712,
    ERROR_HOST_MEMORY_NOT_REGISTERED     = 713,
    ERROR_HARDWARE_STACK_ERROR           = 714,
    ERROR_ILLEGAL_INSTRUCTION            = 715,
    ERROR_MISALIGNED_ADDRESS             = 716,
    ERROR_INVALID_ADDRESS_SPACE          = 717,
    ERROR_INVALID_PC                     = 718,
    ERROR_LAUNCH_FAILED                  = 719,
    ERROR_COOPERATIVE_LAUNCH_TOO_LARGE   = 720,
    ERROR_NOT_PERMITTED                  = 800,
    ERROR_NOT_SUPPORTED                  = 801,
    ERROR_SYSTEM_NOT_READY               = 802,
    ERROR_SYSTEM_DRIVER_MISMATCH         = 803,
    ERROR_COMPAT_NOT_SUPPORTED_ON_DEVICE = 804,
    ERROR_MPS_CONNECTION_FAILED          = 805,
    ERROR_MPS_RPC_FAILURE                = 806,
    ERROR_MPS_SERVER_NOT_READY           = 807,
    ERROR_MPS_MAX_CLIENTS_REACHED        = 808,
    ERROR_MPS_MAX_CONNECTIONS_REACHED    = 809,
    ERROR_STREAM_CAPTURE_UNSUPPORTED     = 900,
    ERROR_STREAM_CAPTURE_INVALIDATED     = 901,
    ERROR_STREAM_CAPTURE_MERGE           = 902,
    ERROR_STREAM_CAPTURE_UNMATCHED       = 903,
    ERROR_STREAM_CAPTURE_UNJOINED        = 904,
    ERROR_STREAM_CAPTURE_ISOLATION       = 905,
    ERROR_STREAM_CAPTURE_IMPLICIT        = 906,
    ERROR_CAPTURED_EVENT                 = 907,
    ERROR_STREAM_CAPTURE_WRONG_THREAD    = 908,
    ERROR_TIMEOUT                        = 909,
    ERROR_GRAPH_EXEC_UPDATE_FAILURE      = 910,
    ERROR_EXTERNAL_DEVICE                = 911,
    ERROR_UNKNOWN                        = 999
}

CUctx_flag :: enum(c.int) {
    SCHED_AUTO,
    SCHED_SPIN,
    SCHED_YIELD,
    SCHED_BLOCKING_SYNC,
    MAP_HOST,
    LMEM_RESIZE_TO_MAX,
}
CUctx_flags :: bit_set[CUctx_flag; c.int]

CUstream_flags :: enum(c.int) {
    DEFAULT             = 0x0,
    NON_BLOCKING        = 0x1
}

CUjit_option :: enum(c.int) {
    MAX_REGISTERS = 0, THREADS_PER_BLOCK, WALL_TIME, INFO_LOG_BUFFER,
    INFO_LOG_BUFFER_SIZE_BYTES, ERROR_LOG_BUFFER, ERROR_LOG_BUFFER_SIZE_BYTES,
    OPTIMIZATION_LEVEL, TARGET_FROM_CUCONTEXT, TARGET, FALLBACK_STRATEGY,
    GENERATE_DEBUG_INFO, LOG_VERBOSE, GENERATE_LINE_INFO, CACHE_MODE,
    NEW_SM3X_OPT, FAST_COMPILE, GLOBAL_SYMBOL_NAMES, GLOBAL_SYMBOL_ADDRESSES,
    GLOBAL_SYMBOL_COUNT, LTO, FTZ, PREC_DIV, PREC_SQRT, FMA, NUM_OPTIONS,
}

CUmemAttach :: enum {
    CU_MEM_ATTACH_GLOBAL,
    CU_MEM_ATTACH_HOST,
    CU_MEM_ATTACH_SINGLE,
};

CUmem_advise :: enum(c.int) {
    SET_READ_MOSTLY          = 1,
    UNSET_READ_MOSTLY        = 2,
    SET_PREFERRED_LOCATION   = 3,
    UNSET_PREFERRED_LOCATION = 4,
    SET_ACCESSED_BY          = 5,
    UNSET_ACCESSED_BY        = 6,
}

CUmem_range_attribute :: enum(c.int) {
    READ_MOSTLY            = 1,
    PREFERRED_LOCATION     = 2,
    ACCESSED_BY            = 3,
    LAST_PREFETCH_LOCATION = 4,
}

CUDA_LAUNCH_PARAMS :: struct {
    function: CUfunction,
    gridDimX: c.uint,
    gridDimY: c.uint,
    gridDimZ: c.uint,
    blockDimX: c.uint,
    blockDimY: c.uint,
    blockDimZ: c.uint,
    sharedMemBytes: c.uint,
    hStream: CUstream,
    kernelParams: [^]rawptr,
}
CUfunction_attribute :: enum(c.int) {
    MAX_THREADS_PER_BLOCK = 0,
    SHARED_SIZE_BYTES = 1,
    CONST_SIZE_BYTES = 2,
    LOCAL_SIZE_BYTES = 3,
    NUM_REGS = 4,
    PTX_VERSION = 5,
    BINARY_VERSION = 6,
    CACHE_MODE_CA = 7,
    MAX_DYNAMIC_SHARED_SIZE_BYTES = 8,
    PREFERRED_SHARED_MEMORY_CARVEOUT = 9,
    MAX
}

CUfunc_cache :: enum(c.int) {
    NONE   = 0,
    SHARED = 1,
    L1     = 2,
    EQUAL  = 3,
}

CUsharedconfig :: enum(c.int) {
    DEFAULT_BANK_SIZE    = 0,
    FOUR_BYTE_BANK_SIZE  = 1,
    EIGHT_BYTE_BANK_SIZE = 2,
}

CUDA_KERNEL_NODE_PARAMS :: struct {
    func:           CUfunction,
    gridDimX:       c.uint,
    gridDimY:       c.uint,
    gridDimZ:       c.uint,
    blockDimX:      c.uint,
    blockDimY:      c.uint,
    blockDimZ:      c.uint,
    sharedMemBytes: c.uint,
    kernelParams:   [^]rawptr,
    extra:          [^]rawptr,
}

CUDA_MEMSET_NODE_PARAMS :: struct {
    dst:         CUdeviceptr,
    pitch:       c.size_t,
    value:       c.uint,
    elementSize: c.uint,
    width:       c.size_t,
    height:      c.size_t,
}

CUmemorytype :: enum(c.int) {
    HOST    = 1,
    DEVICE  = 2,
    ARRAY   = 3,
    UNIFIED = 4,
}

CUDA_MEMCPY3D :: struct {
    srcXInBytes:   c.size_t,
    srcY:          c.size_t,
    srcZ:          c.size_t,
    srcLOD:        c.size_t,
    srcMemoryType: CUmemorytype,
    srcHost:       rawptr,
    srcDevice:     CUdeviceptr,
    srcArray:      CUarray,
    reserved0:     rawptr,
    srcPitch:      c.size_t,
    srcHeight:     c.size_t,
    dstXInBytes:   c.size_t,
    dstY:          c.size_t,
    dstZ:          c.size_t,
    dstLOD:        c.size_t,
    dstMemoryType: CUmemorytype,
    dstHost:       rawptr,
    dstDevice:     CUdeviceptr,
    dstArray:      CUarray,
    reserved1:     rawptr,
    dstPitch:      c.size_t,
    dstHeight:     c.size_t,
    WidthInBytes:  c.size_t,
    Height:        c.size_t,
    Depth:         c.size_t,
}

CUDA_HOST_NODE_PARAMS :: struct {
    fn:       proc "c" (rawptr),     userData: rawptr,   }

CUgraphMem_attribute :: enum(c.int) {
    USED_MEM_CURRENT,
    USED_MEM_HIGH,
    RESERVED_MEM_CURRENT,
    RESERVED_MEM_HIGH,
}

CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS :: struct {
    params: struct {
        fence: struct {
            value: c.ulonglong,
        },
        nvSciSync: struct #raw_union {
            fence: rawptr,
            reserved: c.ulonglong,
        },
        keyedMutex: struct {
            key: c.ulonglong,
        },
        reserved: [12]c.uint,
    },
    flags: c.uint,
    reserved: [16]c.uint,
}
CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS :: struct {
    params:   struct {
        fence:    struct {
            value: c.ulonglong,
        },
        nvSciSync: struct #raw_union {
            fence:    rawptr,
            reserved: c.ulonglong,
        },
        keyedMutex: struct {
            key: c.ulonglong,
            timeoutMs: c.uint,
        },
        reserved: [10]c.uint,
    },
    flags: c.uint,
    reserved: [16]c.uint,
}

CUDA_EXT_SEM_WAIT_NODE_PARAMS :: struct {
    extSemArray: ^CUexternalSemaphore,
    paramsArray: ^CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS,
    numExtSems:  c.uint,
}

CUDA_EXT_SEM_SIGNAL_NODE_PARAMS :: struct {
    extSemArray: ^CUexternalSemaphore,
    paramsArray: ^CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS,
    numExtSems:  c.uint,
}

CUgraphNodeType :: enum(c.int) {
    KERNEL           = 0,
    MEMCPY           = 1,
    MEMSET           = 2,
    HOST             = 3,
    GRAPH            = 4,
    EMPTY            = 5,
    WAIT_EVENT       = 6,
    EVENT_RECORD     = 7,
    EXT_SEMAS_SIGNAL = 8,
    EXT_SEMAS_WAIT   = 9,
    MEM_ALLOC        = 10,
    MEM_FREE         = 11,
}

CUmemLocationType :: enum(c.int) {
    INVALID = 0,
    DEVICE  = 1,
    MAX     = max(c.int),
}

CUmemAllocationType :: enum(c.int) {
    INVALID = 0,
    PINNED = 1,
    MAX = max(c.int),
}

CUmemAllocationGranularity_flags :: enum(c.int) {
    MINIMUM     = 0,
    RECOMMENDED = 1,
}

CUmemOperationType :: enum(c.int) {
    MAP   = 1,
    UNMAP = 2,
}

CUmemAllocationHandleType :: enum(c.int) {
    NONE                  = 0,
    POSIX_FILE_DESCRIPTOR = 1,
    WIN32                 = 2,
    WIN32_KMT             = 4,
    MAX                   = max(c.int),
}
CUmemLocation :: struct {
    type: CUmemLocationType,
    id:   c.int,
}
CUmemPoolProps :: struct {
    allocType:   CUmemAllocationType,
    handleTypes: CUmemAllocationHandleType,
    location:    CUmemLocation,

    win32SecurityAttributes: rawptr,
    reserved:    [64]c.uchar,               }

CUmemAccess_flags :: enum(c.int) {
    NONE      = 0,
    READ      = 1,
    READWRITE = 3,
    MAX       = max(c.int),
}

CUmemAccessDesc :: struct {
    location: CUmemLocation,
    flags:    CUmemAccess_flags
}

CUDA_MEM_ALLOC_NODE_PARAMS :: struct {
    poolProps: CUmemPoolProps,
    accessDescs:     ^CUmemAccessDesc,
    accessDescCount: c.size_t,
    bytesize:        c.size_t,
    dptr:            CUdeviceptr,
}

CUgraphExecUpdateResult :: enum(c.int) {
    SUCCESS                           = 0,
    ERROR                             = 1,
    ERROR_TOPOLOGY_CHANGED            = 2,
    ERROR_NODE_TYPE_CHANGED           = 3,
    ERROR_FUNCTION_CHANGED            = 4,
    ERROR_PARAMETERS_CHANGED          = 5,
    ERROR_NOT_SUPPORTED               = 6,
    ERROR_UNSUPPORTED_FUNCTION_CHANGE = 7,
}

CUkernelNodeAttrID :: enum(c.int) {
    ACCESS_POLICY_WINDOW = 1,
    COOPERATIVE          = 2,
}

CUaccessProperty :: enum(c.int) {
    NORMAL     = 0,
    STREAMING  = 1,
    PERSISTING = 2,
}

CUaccessPolicyWindow :: struct {
    base_ptr:  rawptr,
    num_bytes: c.size_t,
    hitRatio:  f32,
    hitProp:   CUaccessProperty,
    missProp:  CUaccessProperty,
}


CUkernelNodeAttrValue :: struct #raw_union {
    accessPolicyWindow: CUaccessPolicyWindow,
    cooperative:        c.int,
}



CUstreamCaptureMode :: enum(c.int) {
    GLOBAL       = 0,
    THREAD_LOCAL = 1,
    RELAXED      = 2,
}

CUstreamAttrID :: enum(c.int) {
    ACCESS_POLICY_WINDOW   = 1,
    SYNCHRONIZATION_POLICY = 3,
}

CUstreamAttrValue :: struct #raw_union {
    accessPolicyWindow: CUaccessPolicyWindow,
    syncPolicy:         CUsynchronizationPolicy,
}

CUstreamCaptureStatus :: enum(c.int) {
    NONE        = 0,
    ACTIVE      = 1,
    INVALIDATED = 2,
}

CUsynchronizationPolicy :: enum(c.int) {
    CU_SYNC_POLICY_AUTO = 1,
    CU_SYNC_POLICY_SPIN = 2,
    CU_SYNC_POLICY_YIELD = 3,
    CU_SYNC_POLICY_BLOCKING_SYNC = 4
}

CU_MEMHOSTREGISTER :: enum(c.int) {
    PORTABLE,
    DEVICEMAP,
    IOMEMORY,
    READ_ONLY,
}

CUgraphicsMapResourceFlags :: enum(c.int) {
    CU_GRAPHICS_MAP_RESOURCE_FLAGS_NONE          = 0x00,
    CU_GRAPHICS_MAP_RESOURCE_FLAGS_READ_ONLY     = 0x01,
    CU_GRAPHICS_MAP_RESOURCE_FLAGS_WRITE_DISCARD = 0x02
}

CUarray_format :: enum(c.int) {
    UNSIGNED_INT8  = 1,
    UNSIGNED_INT16 = 2,
    UNSIGNED_INT32 = 3,
    SIGNED_INT8    = 8,
    SIGNED_INT16   = 9,
    SIGNED_INT32   = 10,
    HALF           = 16,
    FLOAT          = 32,
    NV12           = 176,
    UNORM_INT8X1   = 192,
    UNORM_INT8X2   = 193,
    UNORM_INT8X4   = 194,
    UNORM_INT16X1  = 195,
    UNORM_INT16X2  = 196,
    UNORM_INT16X4  = 197,
    SNORM_INT8X1   = 198,
    SNORM_INT8X2   = 199,
    SNORM_INT8X4   = 200,
    SNORM_INT16X1  = 201,
    SNORM_INT16X2  = 202,
    SNORM_INT16X4  = 203,
    BC1_UNORM      = 145,
    BC1_UNORM_SRGB = 146,
    BC2_UNORM      = 147,
    BC2_UNORM_SRGB = 148,
    BC3_UNORM      = 149,
    BC3_UNORM_SRGB = 150,
    BC4_UNORM      = 151,
    BC4_SNORM      = 152,
    BC5_UNORM      = 153,
    BC5_SNORM      = 154,
    BC6H_UF16      = 155,
    BC6H_SF16      = 156,
    BC7_UNORM      = 157,
    BC7_UNORM_SRGB = 158,
}

CUDA_ARRAY_DESCRIPTOR :: struct {
    Width:       c.size_t,
    Height:      c.size_t,
    Format:      CUarray_format,
    NumChannels: c.uint,
}

CUDA_ARRAY3D_DESCRIPTOR :: struct {
    Width: c.size_t,
    Height: c.size_t,
    Depth: c.size_t,
    Format: CUarray_format,
    NumChannels: c.uint,
    Flags: c.uint,
}

//cuda is a big fan of opaque pointers
CUdevice :: distinct i32
CUcontext :: distinct rawptr
CUmodule :: distinct rawptr
CUfunction :: distinct rawptr
CUarray :: distinct rawptr
CUmipmappedArray :: distinct rawptr
CUtexref :: distinct rawptr
CUsurfref :: distinct rawptr
CUevent :: distinct rawptr
CUstream :: distinct rawptr
CUdeviceptr :: distinct uintptr
CUexternalMemory :: distinct rawptr
CUexternalSemaphore :: distinct rawptr
CUgraph :: distinct rawptr
CUgraphNode :: distinct rawptr
CUgraphExec :: distinct rawptr
CUmemoryPool :: distinct rawptr
CUuserObject :: distinct rawptr
CUgraphicsResource :: distinct rawptr
CUlinkState :: distinct rawptr
CUtexObject :: distinct c.ulonglong
CUsurfObject :: distinct c.ulonglong

CUmemGenericAllocationHandle :: c.ulonglong
CU_DEVICE_CPU:CUdevice: -1

CUjitInputType :: enum(c.int)
{
    CU_JIT_INPUT_CUBIN = 0,
    CU_JIT_INPUT_PTX,
    CU_JIT_INPUT_FATBINARY,
    CU_JIT_INPUT_OBJECT,
    CU_JIT_INPUT_LIBRARY,
    CU_JIT_INPUT_NVVM,
    CU_JIT_NUM_INPUT_TYPES
}


CUuuid :: struct {
    bytes: [16]c.char,
}

CUipcEventHandle :: struct {
    reserved: [64]c.char,
}

CUipcMemHandle :: struct {
    reserved: [64]c.char,
}

CUDA_MEMCPY2D :: struct {
    srcXInBytes:   c.size_t,
    srcY:          c.size_t,
    srcMemoryType: CUmemorytype,
    srcHost:       rawptr,
    srcDevice:     CUdeviceptr,
    srcArray:      CUarray,
    srcPitch:      c.size_t,
    dstXInBytes:   c.size_t,
    dstY:          c.size_t,
    dstMemoryType: CUmemorytype,
    dstHost:       rawptr,
    dstDevice:     CUdeviceptr,
    dstArray:      CUarray,
    dstPitch:      c.size_t,
    WidthInBytes:  c.size_t,
    Height:        c.size_t,
}

CUDA_MEMCPY3D_PEER :: struct {
    srcXInBytes:   c.size_t,
    srcY:          c.size_t,
    srcZ:          c.size_t,
    srcLOD:        c.size_t,
    srcMemoryType: CUmemorytype,
    srcHost:       rawptr,
    srcDevice:     CUdeviceptr,
    srcArray:      CUarray,
    srcContext:    CUcontext,
    srcPitch:      c.size_t,
    srcHeight:     c.size_t,
    dstXInBytes:   c.size_t,
    dstY:          c.size_t,
    dstZ:          c.size_t,
    dstLOD:        c.size_t,
    dstMemoryType: CUmemorytype,
    dstHost:       rawptr,
    dstDevice:     CUdeviceptr,
    dstArray:      CUarray,
    dstContext:    CUcontext,
    dstPitch:      c.size_t,
    dstHeight:     c.size_t,
    WidthInBytes:  c.size_t,
    Height:        c.size_t,
    Depth:         c.size_t,
}

CUlimit :: enum(c.int) {
    STACK_SIZE                       = 0x00,
    PRINTF_FIFO_SIZE                 = 0x01,
    MALLOC_HEAP_SIZE                 = 0x02,
    DEV_RUNTIME_SYNC_DEPTH           = 0x03,
    DEV_RUNTIME_PENDING_LAUNCH_COUNT = 0x04,
    MAX_L2_FETCH_GRANULARITY         = 0x05,
    PERSISTING_L2_CACHE_SIZE         = 0x06,
    MAX
}

CUmemAllocationProp :: struct {
    type:                 CUmemAllocationType,
    requestedHandleTypes: CUmemAllocationHandleType,
    location:             CUmemLocation,
    win32HandleMetaData:  rawptr,
    allocFlags:           struct {
        mpressionType:      c.uchar,
        gpuDirectRDMACapable: c.uchar,
        usage:                c.ushort,
        reserved:             [4]c.uchar,
    },
}

CUdevice_attribute :: enum(c.int) {
    MAX_THREADS_PER_BLOCK = 1,
    MAX_BLOCK_DIM_X = 2,
    MAX_BLOCK_DIM_Y = 3,
    MAX_BLOCK_DIM_Z = 4,
    MAX_GRID_DIM_X = 5,
    MAX_GRID_DIM_Y = 6,
    MAX_GRID_DIM_Z = 7,
    MAX_SHARED_MEMORY_PER_BLOCK = 8,
    SHARED_MEMORY_PER_BLOCK = 8,
    TOTAL_CONSTANT_MEMORY = 9,
    WARP_SIZE = 10,
    MAX_PITCH = 11,
    MAX_REGISTERS_PER_BLOCK = 12,
    REGISTERS_PER_BLOCK = 12,
    CLOCK_RATE = 13,
    TEXTURE_ALIGNMENT = 14,
    GPU_OVERLAP = 15,
    MULTIPROCESSOR_COUNT = 16,
    KERNEL_EXEC_TIMEOUT = 17,
    INTEGRATED = 18,
    CAN_MAP_HOST_MEMORY = 19,
    COMPUTE_MODE = 20,
    MAXIMUM_TEXTURE1D_WIDTH = 21,
    MAXIMUM_TEXTURE2D_WIDTH = 22,
    MAXIMUM_TEXTURE2D_HEIGHT = 23,
    MAXIMUM_TEXTURE3D_WIDTH = 24,
    MAXIMUM_TEXTURE3D_HEIGHT = 25,
    MAXIMUM_TEXTURE3D_DEPTH = 26,
    MAXIMUM_TEXTURE2D_LAYERED_WIDTH = 27,
    MAXIMUM_TEXTURE2D_LAYERED_HEIGHT = 28,
    MAXIMUM_TEXTURE2D_LAYERED_LAYERS = 29,
    MAXIMUM_TEXTURE2D_ARRAY_WIDTH = 27,
    MAXIMUM_TEXTURE2D_ARRAY_HEIGHT = 28,
    MAXIMUM_TEXTURE2D_ARRAY_NUMSLICES = 29,
    SURFACE_ALIGNMENT = 30,
    CONCURRENT_KERNELS = 31,
    ECC_ENABLED = 32,
    PCI_BUS_ID = 33,
    PCI_DEVICE_ID = 34,
    TCC_DRIVER = 35,
    MEMORY_CLOCK_RATE = 36,
    GLOBAL_MEMORY_BUS_WIDTH = 37,
    L2_CACHE_SIZE = 38,
    MAX_THREADS_PER_MULTIPROCESSOR = 39,
    ASYNC_ENGINE_COUNT = 40,
    UNIFIED_ADDRESSING = 41,
    MAXIMUM_TEXTURE1D_LAYERED_WIDTH = 42,
    MAXIMUM_TEXTURE1D_LAYERED_LAYERS = 43,
    CAN_TEX2D_GATHER = 44,
    MAXIMUM_TEXTURE2D_GATHER_WIDTH = 45,
    MAXIMUM_TEXTURE2D_GATHER_HEIGHT = 46,
    MAXIMUM_TEXTURE3D_WIDTH_ALTERNATE = 47,
    MAXIMUM_TEXTURE3D_HEIGHT_ALTERNATE = 48,
    MAXIMUM_TEXTURE3D_DEPTH_ALTERNATE = 49,
    PCI_DOMAIN_ID = 50,
    TEXTURE_PITCH_ALIGNMENT = 51,
    MAXIMUM_TEXTURECUBEMAP_WIDTH = 52,
    MAXIMUM_TEXTURECUBEMAP_LAYERED_WIDTH = 53,
    MAXIMUM_TEXTURECUBEMAP_LAYERED_LAYERS = 54,
    MAXIMUM_SURFACE1D_WIDTH = 55,
    MAXIMUM_SURFACE2D_WIDTH = 56,
    MAXIMUM_SURFACE2D_HEIGHT = 57,
    MAXIMUM_SURFACE3D_WIDTH = 58,
    MAXIMUM_SURFACE3D_HEIGHT = 59,
    MAXIMUM_SURFACE3D_DEPTH = 60,
    MAXIMUM_SURFACE1D_LAYERED_WIDTH = 61,
    MAXIMUM_SURFACE1D_LAYERED_LAYERS = 62,
    MAXIMUM_SURFACE2D_LAYERED_WIDTH = 63,
    MAXIMUM_SURFACE2D_LAYERED_HEIGHT = 64,
    MAXIMUM_SURFACE2D_LAYERED_LAYERS = 65,
    MAXIMUM_SURFACECUBEMAP_WIDTH = 66,
    MAXIMUM_SURFACECUBEMAP_LAYERED_WIDTH = 67,
    MAXIMUM_SURFACECUBEMAP_LAYERED_LAYERS = 68,
    MAXIMUM_TEXTURE1D_LINEAR_WIDTH = 69,
    MAXIMUM_TEXTURE2D_LINEAR_WIDTH = 70,
    MAXIMUM_TEXTURE2D_LINEAR_HEIGHT = 71,
    MAXIMUM_TEXTURE2D_LINEAR_PITCH = 72,
    MAXIMUM_TEXTURE2D_MIPMAPPED_WIDTH = 73,
    MAXIMUM_TEXTURE2D_MIPMAPPED_HEIGHT = 74,
    COMPUTE_CAPABILITY_MAJOR = 75,
    COMPUTE_CAPABILITY_MINOR = 76,
    MAXIMUM_TEXTURE1D_MIPMAPPED_WIDTH = 77,
    STREAM_PRIORITIES_SUPPORTED = 78,
    GLOBAL_L1_CACHE_SUPPORTED = 79,
    LOCAL_L1_CACHE_SUPPORTED = 80,
    MAX_SHARED_MEMORY_PER_MULTIPROCESSOR = 81,
    MAX_REGISTERS_PER_MULTIPROCESSOR = 82,
    MANAGED_MEMORY = 83,
    MULTI_GPU_BOARD = 84,
    MULTI_GPU_BOARD_GROUP_ID = 85,
    HOST_NATIVE_ATOMIC_SUPPORTED = 86,
    SINGLE_TO_DOUBLE_PRECISION_PERF_RATIO = 87,
    PAGEABLE_MEMORY_ACCESS = 88,
    CONCURRENT_MANAGED_ACCESS = 89,
    COMPUTE_PREEMPTION_SUPPORTED = 90,
    CAN_USE_HOST_POINTER_FOR_REGISTERED_MEM = 91,
    CAN_USE_STREAM_MEM_OPS = 92,
    CAN_USE_64_BIT_STREAM_MEM_OPS = 93,
    CAN_USE_STREAM_WAIT_VALUE_NOR = 94,
    COOPERATIVE_LAUNCH = 95,
    COOPERATIVE_MULTI_DEVICE_LAUNCH = 96,
    MAX_SHARED_MEMORY_PER_BLOCK_OPTIN = 97,
    CAN_FLUSH_REMOTE_WRITES = 98,
    HOST_REGISTER_SUPPORTED = 99,
    PAGEABLE_MEMORY_ACCESS_USES_HOST_PAGE_TABLES = 100,
    DIRECT_MANAGED_MEM_ACCESS_FROM_HOST = 101,
    VIRTUAL_ADDRESS_MANAGEMENT_SUPPORTED = 102,
    VIRTUAL_MEMORY_MANAGEMENT_SUPPORTED = 102,
    HANDLE_TYPE_POSIX_FILE_DESCRIPTOR_SUPPORTED = 103,
    HANDLE_TYPE_WIN32_HANDLE_SUPPORTED = 104,
    HANDLE_TYPE_WIN32_KMT_HANDLE_SUPPORTED = 105,
    MAX_BLOCKS_PER_MULTIPROCESSOR = 106,
    GENERIC_COMPRESSION_SUPPORTED = 107,
    MAX_PERSISTING_L2_CACHE_SIZE = 108,
    MAX_ACCESS_POLICY_WINDOW_SIZE = 109,
    GPU_DIRECT_RDMA_WITH_CUDA_VMM_SUPPORTED = 110,
    RESERVED_SHARED_MEMORY_PER_BLOCK = 111,
    SPARSE_CUDA_ARRAY_SUPPORTED = 112,
    READ_ONLY_HOST_REGISTER_SUPPORTED = 113,
    TIMELINE_SEMAPHORE_INTEROP_SUPPORTED = 114,
    MEMORY_POOLS_SUPPORTED = 115,
    GPU_DIRECT_RDMA_SUPPORTED = 116,
    GPU_DIRECT_RDMA_FLUSH_WRITES_OPTIONS = 117,
    GPU_DIRECT_RDMA_WRITES_ORDERING = 118,
    MEMPOOL_SUPPORTED_HANDLE_TYPES = 119,
    MAX
}

CUpointer_attribute :: enum(c.int) {
    CONTEXT = 1,
    MEMORY_TYPE = 2,
    DEVICE_POINTER = 3,
    HOST_POINTER = 4,
    P2P_TOKENS = 5,
    SYNC_MEMOPS = 6,
    BUFFER_ID = 7,
    IS_MANAGED = 8,
    DEVICE_ORDINAL = 9,
    IS_LEGACY_CUDA_IPC_CAPABLE = 10,
    RANGE_START_ADDR = 11,
    RANGE_SIZE = 12,
    MAPPED = 13,
    ALLOWED_HANDLE_TYPES = 14,
    IS_GPU_DIRECT_RDMA_CAPABLE = 15,
    ACCESS_FLAGS = 16,
    MEMPOOL_HANDLE = 17
}

CUmemPool_attribute :: enum(c.int) {
    REUSE_FOLLOW_EVENT_DEPENDENCIES = 1,
    REUSE_ALLOW_OPPORTUNISTIC,
    REUSE_ALLOW_INTERNAL_DEPENDENCIES,
    RELEASE_THRESHOLD,
    RESERVED_MEM_CURRENT,
    RESERVED_MEM_HIGH,
    USED_MEM_CURRENT,
    USED_MEM_HIGH
}

CUDA_ARRAY_SPARSE_PROPERTIES :: struct {
    tileExtent:        struct {
        width:  c.uint,
        height: c.uint,
        depth:  c.uint,
    },
    miptailFirstLevel: c.uint,
    miptailSize:       c.ulonglong,
    flags:             c.uint,
    reserved:          [4]c.uint,
}

CUresourcetype :: enum(c.int) {
    ARRAY           = 0,
    MIPMAPPED_ARRAY = 1,
    LINEAR          = 2,
    PITCH2D         = 3,
}

CUDA_RESOURCE_DESC :: struct {
    resType: CUresourcetype,
    res: struct #raw_union {
        array: struct {
            hArray: CUarray,
        },
        mipmap: struct {
            hMipmappedArray: CUmipmappedArray,
        },
        linear: struct {
            devPtr:      CUdeviceptr,
            format:      CUarray_format,
            numChannels: c.uint,
            sizeInBytes: c.size_t,
        },
        pitch2D: struct {
            devPtr:       CUdeviceptr,
            format:       CUarray_format,
            numChannels:  c.uint,
            width:        c.size_t,
            height:       c.size_t,
            pitchInBytes: c.size_t,
        },
        reserved: struct {
            reserved: [32]c.int,
        },
    },
    flags:   c.uint,
}

CUaddress_mode :: enum(c.int) {
    WRAP   = 0,
    CLAMP  = 1,
    MIRROR = 2,
    BORDER = 3,
}

CUfilter_mode :: enum(c.int) {
    POINT  = 0,
    LINEAR = 1,
}

CUDA_TEXTURE_DESC :: struct {
    addressMode:         [3]CUaddress_mode,
    filterMode:          CUfilter_mode,
    flags:               c.uint,
    maxAnisotropy:       c.uint,
    mipmapFilterMode:    CUfilter_mode,
    mipmapLevelBias:     f32,
    minMipmapLevelClamp: f32,
    maxMipmapLevelClamp: f32,
    borderColor:         [4]f32,
    reserved:            [12]c.int,
}

CUresourceViewFormat :: enum(c.int) {
    NONE          = 0x00,
    UINT_1X8      = 0x01,
    UINT_2X8      = 0x02,
    UINT_4X8      = 0x03,
    SINT_1X8      = 0x04,
    SINT_2X8      = 0x05,
    SINT_4X8      = 0x06,
    UINT_1X16     = 0x07,
    UINT_2X16     = 0x08,
    UINT_4X16     = 0x09,
    SINT_1X16     = 0x0a,
    SINT_2X16     = 0x0b,
    SINT_4X16     = 0x0c,
    UINT_1X32     = 0x0d,
    UINT_2X32     = 0x0e,
    UINT_4X32     = 0x0f,
    SINT_1X32     = 0x10,
    SINT_2X32     = 0x11,
    SINT_4X32     = 0x12,
    FLOAT_1X16    = 0x13,
    FLOAT_2X16    = 0x14,
    FLOAT_4X16    = 0x15,
    FLOAT_1X32    = 0x16,
    FLOAT_2X32    = 0x17,
    FLOAT_4X32    = 0x18,
    UNSIGNED_BC1  = 0x19,
    UNSIGNED_BC2  = 0x1a,
    UNSIGNED_BC3  = 0x1b,
    UNSIGNED_BC4  = 0x1c,
    SIGNED_BC4    = 0x1d,
    UNSIGNED_BC5  = 0x1e,
    SIGNED_BC5    = 0x1f,
    UNSIGNED_BC6H = 0x20,
    SIGNED_BC6H   = 0x21,
    UNSIGNED_BC7  = 0x22
}

CUDA_RESOURCE_VIEW_DESC :: struct {
    format:           CUresourceViewFormat,
    width:            c.size_t,
    height:           c.size_t,
    depth:            c.size_t,
    firstMipmapLevel: c.uint,
    lastMipmapLevel:  c.uint,
    firstLayer:       c.uint,
    lastLayer:        c.uint,
    reserved:         [16]c.uint,
}

CUdriverProcAddress_flags :: enum(c.int) {
    DEFAULT                   = 0,
    LEGACY_STREAM             = 1,
    PER_THREAD_DEFAULT_STREAM = 2,
}

CUexecAffinityType :: enum(c.int) {
    SM_COUNT = 0,
    MAX,
}

CUexecAffinitySmCount :: struct {
    val: c.uint,
}

CUexecAffinityParam :: struct {
    type: CUexecAffinityType,
    param: struct #raw_union {
        smCount: CUexecAffinitySmCount,
    },
}

CUdevice_P2PAttribute :: enum(c.int) {
    PERFORMANCE_RANK                     = 0x01,
    ACCESS_SUPPORTED                     = 0x02,
    NATIVE_ATOMIC_SUPPORTED              = 0x03,
    ACCESS_ACCESS_SUPPORTED              = 0x04,
    CUDA_ARRAY_ACCESS_SUPPORTED          = 0x04
}

CUevent_flag :: enum(c.int) {
    BLOCKING_SYNC,
    DISABLE_TIMING,
    INTERPROCESS,
}
CUevent_flags :: bit_set[CUevent_flag; c.int]

CUevent_record_flags :: enum(c.int) {
    DEFAULT  = 0,
    EXTERNAL = 1,
}

CUevent_wait_flags :: enum(c.int) {
    DEFAULT  = 0,
    EXTERNAL = 1,
}

CUstreamWaitValue_flags :: enum(c.int) {
    GEQ   = 0,
    EQ    = 1,
    AND   = 2,
    NOR   = 3,
    FLUSH = 1073741824,
}

CUstreamWriteValue_flags :: enum(c.int) {
    DEFAULT           = 0,
    NO_MEMORY_BARRIER = 1,
}

CUstreamBatchMemOpType :: enum(c.int) {
    WAIT_VALUE_32       = 1,
    WRITE_VALUE_32      = 2,
    WAIT_VALUE_64       = 4,
    WRITE_VALUE_64      = 5,
    FLUSH_REMOTE_WRITES = 3,
}

CUstreamBatchMemOpParams :: struct #raw_union {
    operation: CUstreamBatchMemOpType,
    waitValue: struct {
        operation: CUstreamBatchMemOpType,
        address:   CUdeviceptr,
        using _: struct #raw_union {
            value:   u32,
            value64: u64,
        },
        flags:     c.uint,
        alias:     CUdeviceptr,
    },
    writeValue: struct {
        operation: CUstreamBatchMemOpType,
        address:   CUdeviceptr,
        using _: struct #raw_union {
            value:   u32,
            value64: u64,
        },
        flags:     c.uint,
        alias:     CUdeviceptr,
    },
    flushRemoteWrites: struct {
        operation: CUstreamBatchMemOpType,
        flags:     c.uint,
    },
    pad:       [6]u64,
}
CUflushGPUDirectRDMAWritesTarget :: enum(c.int) {
    CU_FLUSH_GPU_DIRECT_RDMA_WRITES_TARGET_CURRENT_CTX = 0
}
CUflushGPUDirectRDMAWritesScope :: enum(c.int) {
    CU_FLUSH_GPU_DIRECT_RDMA_WRITES_TO_OWNER       = 100,
    CU_FLUSH_GPU_DIRECT_RDMA_WRITES_TO_ALL_DEVICES = 200
}
CUmemPoolPtrExportData :: struct {
    reserved: [64]c.uchar,
}

CUarraySparseSubresourceType :: enum(c.int) {
    SPARSE_LEVEL = 0,
    MIPTAIL      = 1,
}

CUmemHandleType :: enum(c.int) {
    CU_MEM_HANDLE_TYPE_GENERIC = 0,
}
CUarrayMapInfo :: struct {
    resourceType:     CUresourcetype,
    resource:         struct #raw_union {
        mipmap: CUmipmappedArray,
        array:  CUarray,
    },
    subresourceType:  CUarraySparseSubresourceType,
    subresource:      struct #raw_union {
        sparseLevel: struct {
            level:        c.uint,
            layer:        c.uint,
            offsetX:      c.uint,
            offsetY:      c.uint,
            offsetZ:      c.uint,
            extentWidth:  c.uint,
            extentHeight: c.uint,
            extentDepth:  c.uint,
        },
        miptail: struct {
            layer:  c.uint,
            offset: c.ulonglong,
            size:   c.ulonglong,
        },
    },
    memOperationType: CUmemOperationType,
    memHandleType:    CUmemHandleType,
    memHandle:        struct #raw_union {
        memHandle: CUmemGenericAllocationHandle,
    },
    offset:           c.ulonglong,
    deviceBitMask:    c.uint,
    flags:            c.uint,
    reserved:         [2]c.uint,
}

CUexternalMemoryHandleType :: enum c.int {
    OPAQUE_FD          = 1,
    OPAQUE_WIN32       = 2,
    OPAQUE_WIN32_KMT   = 3,
    D3D12_HEAP         = 4,
    D3D12_RESOURCE     = 5,
    D3D11_RESOURCE     = 6,
    D3D11_RESOURCE_KMT = 7,
    NVSCIBUF           = 8,
    DMABUF_FD          = 9,

}

CUDA_EXTERNAL_MEMORY_HANDLE_DESC :: struct {
    type:     CUexternalMemoryHandleType,
    handle:   struct #raw_union {
        fd:             linux.Fd,
        win32:          struct {
            handle: rawptr,
            name:   rawptr,
        },
        nvSciBufObject: rawptr,
    },
    size:     c.ulonglong,
    flags:    c.uint,
    reserved: [16]c.uint,
}

CUDA_EXTERNAL_MEMORY_BUFFER_DESC :: struct {
    offset:   c.ulonglong,
    size:     c.ulonglong,
    flags:    c.uint,
    reserved: [16]c.uint,
}

CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC :: struct {
    offset:    c.ulonglong,
    arrayDesc: CUDA_ARRAY3D_DESCRIPTOR,
    numLevels: c.uint,
    reserved:  [16]c.uint,
}

CUexternalSemaphoreHandleType :: enum(c.int) {
    OPAQUE_FD                = 1,
    OPAQUE_WIN32             = 2,
    OPAQUE_WIN32_KMT         = 3,
    D3D12_FENCE              = 4,
    D3D11_FENCE              = 5,
    NVSCISYNC                = 6,
    D3D11_KEYED_MUTEX        = 7,
    D3D11_KEYED_MUTEX_KMT    = 8,
    TIMELINE_SEMAPHORE_FD    = 9,
    TIMELINE_SEMAPHORE_WIN32 = 10,
}

CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC :: struct {
    type:     CUexternalSemaphoreHandleType,
    handle:   struct #raw_union {
        fd:           linux.Fd,
        win32:        struct {
            handle: rawptr,
            name:   rawptr,
        },
        nvSciSyncObj: rawptr,
    },
    flags:    c.uint,
    reserved: [16]c.uint,
}

when (ODIN_OS == .Windows) {
    foreign import lib "system:libcuda.lib"
} else {
    foreign import lib "system:libcuda.so"
}
@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    //SETUP
    cuGetErrorString  :: proc(error: CUresult, pStr: ^cstring) -> CUresult ---
    cuInit :: proc(flags: c.uint) -> CUresult ---
    cuDeviceGet :: proc(devicePtr: ^CUdevice, ordinal: i32) -> CUresult ---
    cuCtxCreate_v2 :: proc(ctx: ^CUcontext, flags: CUctx_flags, device: CUdevice) -> CUresult ---
    cuDeviceGetCount :: proc(count: ^c.int) -> CUresult ---
    cuStreamCreate :: proc(phStream: ^CUstream, flags: CUstream_flags) -> CUresult ---
    cuStreamSynchronize :: proc(hStream: CUstream) -> CUresult ---
    cuStreamDestroy :: proc(hStream: CUstream) -> CUresult ---

    //MEMORY OPERATIONS
    cuMemAlloc_v2 :: proc(dptr: ^CUdeviceptr, bytesize: int) -> CUresult ---
    cuMemAllocPitch_v2  :: proc(dptr: ^CUdeviceptr, pPitch: ^int, WidthInBytes: int, Height: int, ElementSizeBytes: c.uint) -> CUresult ---
    cuMemAllocHost_v2  :: proc(pp: ^CUdeviceptr, bytesize: int) -> CUresult ---

    cuMemFree_v2 :: proc(dptr: CUdeviceptr) -> CUresult ---

    cuMemGetInfo_v2  :: proc(free: ^int, total: ^int) -> CUresult ---
    cuMemGetAddressRange_v2  :: proc(pbase: ^CUdeviceptr, psize: ^int, dptr:CUdeviceptr) -> CUresult ---

    cuMemcpyAtoH_v2 :: proc(dstHost: ^u8, srcArray: CUarray, srcOffset: int, ByteCount: int) -> CUresult ---
    cuMemcpyDtoH_v2 :: proc(dstHost: ^u8, srcDevice: CUdeviceptr, ByteCount: int) -> CUresult ---
    cuMemcpyHtoA_v2 :: proc(dstArray: CUarray, dstOffset: int, srcHost: ^u8, ByteCount: int) -> CUresult ---
    cuMemcpyAtoA_v2 :: proc(dstArray: CUarray, dstOffset: int, srcArray: CUarray, srcOffset: int, ByteCount: int) -> CUresult ---
    cuMemcpyDtoA_v2 :: proc(dstArray: CUarray, dstOffset: int, srcDevice: CUdeviceptr, ByteCount: int) -> CUresult ---
    cuMemcpyHtoD_v2 :: proc(dstDevice: CUdeviceptr, srcHost: ^u8, ByteCount: int) -> CUresult ---
    cuMemcpyAtoD_v2 :: proc(dstDevice: CUdeviceptr, srcArray: CUarray, srcOffset: int, ByteCount: int) -> CUresult ---
    cuMemcpyDtoD_v2 :: proc(dstDevice: CUdeviceptr, srcDevice: CUdeviceptr, ByteCount: int) -> CUresult ---
    // no cuMemcpyHtoH because that's just ordinary memcpy.

    //MODULES AND KERNELS

    cuModuleLoad  :: proc(module: ^CUmodule, fname: cstring) -> CUresult ---
    cuModuleLoadData  :: proc(module: ^CUmodule, image: ^u8) -> CUresult ---
    cuModuleLoadDataEx  :: proc(module: ^CUmodule, image: ^u8, numOptions: c.uint, options: ^CUjit_option, optionValues: ^rawptr) -> CUresult ---
    cuModuleLoadFatBinary  :: proc(module: ^CUmodule, fatCubin: rawptr) -> CUresult ---
    cuModuleUnload  :: proc(hmod: CUmodule) -> CUresult ---
    cuModuleGetFunction  :: proc(hfunc: ^CUfunction, hmod: CUmodule, name: cstring) -> CUresult ---
    cuModuleGetTexRef  :: proc(pTexRef: ^CUtexref, hmod: CUmodule, name: cstring) -> CUresult ---
    cuModuleGetSurfRef  :: proc(pSurfRef: ^CUsurfref, hmod: CUmodule, name: cstring) -> CUresult ---
    cuModuleGetGlobal_v2  :: proc(dptr: ^CUdeviceptr, bytes: ^int, hmod: CUmodule, name: cstring) -> CUresult ---
    cuLaunchKernel  :: proc(f: CUfunction, gridDimX: c.uint, gridDimY: c.uint, gridDimZ: c.uint, blockDimX: c.uint, blockDimY: c.uint, blockDimZ: c.uint, sharedMemBytes: c.uint, hStream: CUstream, kernelParams: [^]rawptr, extra: [^]rawptr) -> CUresult ---
    cuLaunchCooperativeKernel  :: proc(f: CUfunction, gridDimX: c.uint, gridDimY: c.uint, gridDimZ: c.uint, blockDimX: c.uint, blockDimY: c.uint, blockDimZ: c.uint, sharedMemBytes: c.uint, hStream: CUstream, kernelParams: [^]rawptr) -> CUresult ---
    cuLaunchCooperativeKernelMultiDevice  :: proc(launchParamsList: ^CUDA_LAUNCH_PARAMS, numDevices: c.uint, flags: c.uint) -> CUresult ---
    cuLaunchHostFunc  :: proc(hStream: CUstream, fn: proc "c" (userData: rawptr), userData: rawptr) -> CUresult ---
    cuLaunch  :: proc(f: CUfunction) -> CUresult ---
    cuLaunchGrid  :: proc(f: CUfunction, grid_width: c.int, grid_height: c.int) -> CUresult ---
    cuLaunchGridAsync  :: proc(f: CUfunction, grid_width: c.int, grid_height: c.int, hStream: CUstream) -> CUresult ---
    cuFuncGetAttribute  :: proc(pi: ^c.int, attrib: CUfunction_attribute, hfunc: CUfunction) -> CUresult ---
    cuFuncSetAttribute  :: proc(hfunc: CUfunction, attrib: CUfunction_attribute, value: c.int) -> CUresult ---
    cuFuncSetCacheConfig  :: proc(hfunc: CUfunction, config: CUfunc_cache) -> CUresult ---
    cuFuncSetSharedMemConfig  :: proc(hfunc: CUfunction, config: CUsharedconfig) -> CUresult ---
    cuFuncGetModule  :: proc(hmod: ^CUmodule, hfunc: CUfunction) -> CUresult ---
    cuFuncSetBlockShape  :: proc(hfunc: CUfunction, x: c.int, y: c.int, z: c.int) -> CUresult ---
    cuFuncSetSharedSize  :: proc(hfunc: CUfunction, bytes: c.uint) -> CUresult ---
    cuParamSetSize  :: proc(hfunc: CUfunction, numbytes: c.uint) -> CUresult ---
    cuParamSeti  :: proc(hfunc: CUfunction, offset: c.int, value: c.uint) -> CUresult ---
    cuParamSetf  :: proc(hfunc: CUfunction, offset: c.int, value: f32) -> CUresult ---
    cuParamSetv  :: proc(hfunc: CUfunction, offset: c.int, ptr: rawptr, numbytes: c.uint) -> CUresult ---
    cuParamSetTexRef  :: proc(hfunc: CUfunction, texunit: c.int, hTexRef: CUtexref) -> CUresult ---
    cuMemcpyAsync :: proc(dst: CUdeviceptr, src: CUdeviceptr, ByteCount: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemFreeAsync :: proc(dptr: CUdeviceptr, hStream: CUstream) -> CUresult ---
    cuMemAllocAsync :: proc(dptr: ^CUdeviceptr, bytesize: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemcpyAtoHAsync_v2 :: proc(dstHost: ^u8, srcArray: CUarray, srcOffset: int, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyDtoHAsync_v2 :: proc(dstHost: ^u8, srcDevice: CUdeviceptr, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyHtoAAsync_v2 :: proc(dstArray: CUarray, dstOffset: int, srcHost: ^u8, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyAtoAAsync_v2 :: proc(dstArray: CUarray, dstOffset: int, srcArray: CUarray, srcOffset: int, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyDtoAAsync_v2 :: proc(dstArray: CUarray, dstOffset: int, srcDevice: CUdeviceptr, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyHtoDAsync_v2 :: proc(dstDevice: CUdeviceptr, srcHost: ^u8, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyAtoDAsync_v2 :: proc(dstDevice: CUdeviceptr, srcArray: CUarray, srcOffset: int, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemcpyDtoDAsync_v2 :: proc(dstDevice: CUdeviceptr, srcDevice: CUdeviceptr, ByteCount: int, hStream: CUstream) -> CUresult ---
    cuMemHostGetDevicePointer_v2 :: proc(pdptr: ^CUdeviceptr, p: rawptr, flags: c.int) -> CUresult ---
    cuMemsetD8_v2 :: proc(dstDevice: CUdeviceptr, uc: u8, N: c.size_t) -> CUresult ---
    cuMemsetD16_v2 :: proc(dstDevice: CUdeviceptr, us: u16, N: c.size_t) -> CUresult ---
    cuMemsetD32_v2 :: proc(dstDevice: CUdeviceptr, ui: u32, N: c.size_t) -> CUresult ---
    cuMemsetD2D8_v2 :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, uc: u8, Width: c.size_t, Height: c.size_t) -> CUresult ---
    cuMemsetD2D16_v2 :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, us: u16, Width: c.size_t, Height: c.size_t) -> CUresult ---
    cuMemsetD2D32_v2 :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, ui: u32, Width: c.size_t, Height: c.size_t) -> CUresult ---
    cuMemsetD8Async :: proc(dstDevice: CUdeviceptr, uc: u8, N: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemsetD16Async :: proc(dstDevice: CUdeviceptr, us: u16, N: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemsetD32Async :: proc(dstDevice: CUdeviceptr, ui: u32, N: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemsetD2D8Async :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, uc: u8, Width: c.size_t, Height: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemsetD2D16Async :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, us: u16, Width: c.size_t, Height: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemsetD2D32Async :: proc(dstDevice: CUdeviceptr, dstPitch: c.size_t, ui: u32, Width: c.size_t, Height: c.size_t, hStream: CUstream) -> CUresult ---
    cuStreamBeginCapture :: proc(hStream: CUstream) -> CUresult ---
    cuStreamBeginCapture_ptsz :: proc(hStream: CUstream) -> CUresult ---
    cuStreamBeginCapture_v2 :: proc(hStream: CUstream, mode: CUstreamCaptureMode) -> CUresult ---
    cuStreamEndCapture :: proc(hStream: CUstream, phGraph: ^CUgraph) -> CUresult ---
    cuStreamIsCapturing :: proc(hStream: CUstream, captureStatus: ^CUstreamCaptureStatus) -> CUresult ---
    cuStreamGetCaptureInfo :: proc(hStream: CUstream, captureStatus_out: ^CUstreamCaptureStatus, id_out: ^u64) -> CUresult ---
    cuStreamGetCaptureInfo_v2 :: proc(hStream: CUstream, captureStatus_out: ^CUstreamCaptureStatus, id_out: ^u64, graph_out: ^CUgraph, dependencies_out:^[^]CUgraphNode, numDependencies_out:^c.size_t) -> CUresult ---
    cuStreamCopyAttributes :: proc(dstStream: CUstream, srcStream: CUstream) -> CUresult ---
    cuStreamGetAttribute :: proc(hStream: CUstream, attr: CUstreamAttrID, value: ^CUstreamAttrValue) -> CUresult ---
    cuStreamSetAttribute :: proc(hStream: CUstream, attr: CUstreamAttrID, param: ^CUstreamAttrValue) -> CUresult ---
    cuGraphCreate :: proc(phGraph: ^CUgraph, flags: c.uint) -> CUresult ---
    cuGraphAddKernelNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, nodeParams: ^CUDA_KERNEL_NODE_PARAMS) -> CUresult ---
    cuGraphKernelNodeGetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_KERNEL_NODE_PARAMS) -> CUresult ---
    cuGraphKernelNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_KERNEL_NODE_PARAMS) -> CUresult ---
    cuGraphAddMemcpyNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, copyParams: ^CUDA_MEMCPY3D, ctx: CUcontext) -> CUresult ---
    cuGraphMemcpyNodeGetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_MEMCPY3D) -> CUresult ---
    cuGraphMemcpyNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_MEMCPY3D) -> CUresult ---
    cuGraphAddMemsetNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, memsetParams: ^CUDA_MEMSET_NODE_PARAMS, ctx: CUcontext) -> CUresult ---
    cuGraphMemsetNodeGetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_MEMSET_NODE_PARAMS) -> CUresult ---
    cuGraphMemsetNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_MEMSET_NODE_PARAMS) -> CUresult ---
    cuGraphAddHostNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, nodeParams: ^CUDA_HOST_NODE_PARAMS) -> CUresult ---
    cuGraphHostNodeGetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_HOST_NODE_PARAMS) -> CUresult ---
    cuGraphHostNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_HOST_NODE_PARAMS) -> CUresult ---
    cuGraphAddChildGraphNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, childGraph: CUgraph) -> CUresult ---
    cuGraphChildGraphNodeGetGraph :: proc(hNode: CUgraphNode, phGraph: ^CUgraph) -> CUresult ---
    cuGraphAddEmptyNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t) -> CUresult ---
    cuGraphAddEventRecordNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, event: CUevent) -> CUresult ---
    cuGraphEventRecordNodeGetEvent :: proc(hNode: CUgraphNode, event_out: ^CUevent) -> CUresult ---
    cuGraphEventRecordNodeSetEvent :: proc(hNode: CUgraphNode, event: CUevent) -> CUresult ---
    cuGraphAddEventWaitNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, event: CUevent) -> CUresult ---
    cuGraphEventWaitNodeGetEvent :: proc(hNode: CUgraphNode, event_out: ^CUevent) -> CUresult ---
    cuGraphEventWaitNodeSetEvent :: proc(hNode: CUgraphNode, event: CUevent) -> CUresult ---
    cuGraphAddExternalSemaphoresSignalNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, nodeParams: ^CUDA_EXT_SEM_SIGNAL_NODE_PARAMS) -> CUresult ---
    cuGraphExternalSemaphoresSignalNodeGetParams :: proc(hNode: CUgraphNode, params_out: ^CUDA_EXT_SEM_SIGNAL_NODE_PARAMS) -> CUresult ---
    cuGraphExternalSemaphoresSignalNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_EXT_SEM_SIGNAL_NODE_PARAMS) -> CUresult ---
    cuGraphAddExternalSemaphoresWaitNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, nodeParams: ^CUDA_EXT_SEM_WAIT_NODE_PARAMS) -> CUresult ---
    cuGraphExternalSemaphoresWaitNodeGetParams :: proc(hNode: CUgraphNode, params_out: ^CUDA_EXT_SEM_WAIT_NODE_PARAMS) -> CUresult ---
    cuGraphExternalSemaphoresWaitNodeSetParams :: proc(hNode: CUgraphNode, nodeParams: ^CUDA_EXT_SEM_WAIT_NODE_PARAMS) -> CUresult ---
    cuGraphAddMemAllocNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, nodeParams: ^CUDA_MEM_ALLOC_NODE_PARAMS) -> CUresult ---
    cuGraphMemAllocNodeGetParams :: proc(hNode: CUgraphNode, params_out: ^CUDA_MEM_ALLOC_NODE_PARAMS) -> CUresult ---
    cuGraphAddMemFreeNode :: proc(phGraphNode: ^CUgraphNode, hGraph: CUgraph, dependencies: ^CUgraphNode, numDependencies: c.size_t, dptr: CUdeviceptr) -> CUresult ---
    cuGraphMemFreeNodeGetParams :: proc(hNode: CUgraphNode, dptr_out: ^CUdeviceptr) -> CUresult ---
    cuDeviceGraphMemTrim :: proc(device: CUdevice) -> CUresult ---
    cuDeviceGetGraphMemAttribute :: proc(device: CUdevice, attr: CUgraphMem_attribute, value: rawptr) -> CUresult ---
    cuDeviceSetGraphMemAttribute :: proc(device: CUdevice, attr: CUgraphMem_attribute, value: rawptr) -> CUresult ---
    cuGraphClone :: proc(phGraphClone: ^CUgraph, originalGraph: CUgraph) -> CUresult ---
    cuGraphNodeFindInClone :: proc(phNode: ^CUgraphNode, hOriginalNode: CUgraphNode, hClonedGraph: CUgraph) -> CUresult ---
    cuGraphNodeGetType :: proc(hNode: CUgraphNode, type: ^CUgraphNodeType) -> CUresult ---
    cuGraphGetNodes :: proc(hGraph: CUgraph, nodes: ^CUgraphNode, numNodes: ^c.size_t) -> CUresult ---
    cuGraphGetRootNodes :: proc(hGraph: CUgraph, rootNodes: ^CUgraphNode, numRootNodes: ^c.size_t) -> CUresult ---
    cuGraphGetEdges :: proc(hGraph: CUgraph, from: ^CUgraphNode, to: ^CUgraphNode, numEdges: ^c.size_t) -> CUresult ---
    cuGraphNodeGetDependencies :: proc(hNode: CUgraphNode, dependencies: ^CUgraphNode, numDependencies: ^c.size_t) -> CUresult ---
    cuGraphNodeGetDependentNodes :: proc(hNode: CUgraphNode, dependentNodes: ^CUgraphNode, numDependentNodes: ^c.size_t) -> CUresult ---
    cuGraphAddDependencies :: proc(hGraph: CUgraph, from: ^CUgraphNode, to: ^CUgraphNode, numDependencies: c.size_t) -> CUresult ---
    cuGraphRemoveDependencies :: proc(hGraph: CUgraph, from: ^CUgraphNode, to: ^CUgraphNode, numDependencies: c.size_t) -> CUresult ---
    cuGraphDestroyNode :: proc(hNode: CUgraphNode) -> CUresult ---
    cuGraphInstantiateWithFlags :: proc(phGraphExec: ^CUgraphExec, hGraph: CUgraph, flags: c.ulonglong) -> CUresult ---
    cuGraphExecKernelNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, nodeParams: ^CUDA_KERNEL_NODE_PARAMS) -> CUresult ---
    cuGraphExecMemcpyNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, copyParams: ^CUDA_MEMCPY3D, ctx: CUcontext) -> CUresult ---
    cuGraphExecMemsetNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, memsetParams: ^CUDA_MEMSET_NODE_PARAMS, ctx: CUcontext) -> CUresult ---
    cuGraphExecHostNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, nodeParams: ^CUDA_HOST_NODE_PARAMS) -> CUresult ---
    cuGraphExecChildGraphNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, childGraph: CUgraph) -> CUresult ---
    cuGraphExecEventRecordNodeSetEvent :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, event: CUevent) -> CUresult ---
    cuGraphExecEventWaitNodeSetEvent :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, event: CUevent) -> CUresult ---
    cuGraphExecExternalSemaphoresSignalNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, nodeParams: ^CUDA_EXT_SEM_SIGNAL_NODE_PARAMS) -> CUresult ---
    cuGraphExecExternalSemaphoresWaitNodeSetParams :: proc(hGraphExec: CUgraphExec, hNode: CUgraphNode, nodeParams: ^CUDA_EXT_SEM_WAIT_NODE_PARAMS) -> CUresult ---
    cuGraphUpload :: proc(hGraphExec: CUgraphExec, hStream: CUstream) -> CUresult ---
    cuGraphLaunch :: proc(hGraphExec: CUgraphExec, hStream: CUstream) -> CUresult ---
    cuGraphExecDestroy :: proc(hGraphExec: CUgraphExec) -> CUresult ---
    cuGraphDestroy :: proc(hGraph: CUgraph) -> CUresult ---
    cuGraphExecUpdate :: proc(hGraphExec: CUgraphExec, hGraph: CUgraph, hErrorNode_out: ^CUgraphNode, updateResult_out: ^CUgraphExecUpdateResult) -> CUresult ---
    cuGraphKernelNodeCopyAttributes :: proc(dst: CUgraphNode, src: CUgraphNode) -> CUresult ---
    cuGraphKernelNodeGetAttribute :: proc(hNode: CUgraphNode, attr: CUkernelNodeAttrID, value_out: ^CUkernelNodeAttrValue) -> CUresult ---
    cuGraphKernelNodeSetAttribute :: proc(hNode: CUgraphNode, attr: CUkernelNodeAttrID, value: ^CUkernelNodeAttrValue) -> CUresult ---
    cuGraphDebugDotPrint :: proc(hGraph: CUgraph, path: cstring, flags: c.uint) -> CUresult ---
    cuUserObjectCreate :: proc(object_out: ^CUuserObject, ptr: rawptr, destroy: proc "c" (rawptr), initialRefcount: c.uint, flags: c.uint) -> CUresult ---
    cuUserObjectRetain :: proc(object: CUuserObject, count: c.uint) -> CUresult ---
    cuUserObjectRelease :: proc(object: CUuserObject, count: c.uint) -> CUresult ---
    cuGraphRetainUserObject :: proc(graph: CUgraph, object: CUuserObject, count: c.uint, flags: c.uint) -> CUresult ---
    cuGraphReleaseUserObject :: proc(graph: CUgraph, object: CUuserObject, count: c.uint) -> CUresult ---
    cuArrayCreate_v2 :: proc(pHandle: ^CUarray, pAllocateArray: ^CUDA_ARRAY_DESCRIPTOR) -> CUresult ---
    cuArrayGetDescriptor_v2 :: proc(pArrayDescriptor: ^CUDA_ARRAY_DESCRIPTOR, hArray: CUarray) -> CUresult ---
    cuArray3DCreate_v2 :: proc(pHandle: ^CUarray, pAllocateArray: ^CUDA_ARRAY3D_DESCRIPTOR) -> CUresult ---
    cuArray3DGetDescriptor_v2 :: proc(pArrayDescriptor: ^CUDA_ARRAY3D_DESCRIPTOR, hArray: CUarray) -> CUresult ---
    cuGraphicsResourceGetMappedPointer_v2 :: proc(pDevPtr: ^CUdeviceptr, pSize: ^c.size_t, resource: CUgraphicsResource) -> CUresult ---
    cuEventDestroy_v2 :: proc(hEvent: CUevent) -> CUresult ---
    cuLinkCreate_v2 :: proc(numOptions: c.uint, options: [^]CUjit_option, optionValues: [^]rawptr, stateOut: ^CUlinkState) -> CUresult ---
    cuLinkAddData_v2 :: proc(state: CUlinkState, type: CUjitInputType, data:rawptr, size: c.size_t, name:cstring, numOptions: c.uint, options: [^]CUjit_option, optionValues: [^]rawptr) -> CUresult ---
    cuLinkAddFile :: proc(state: CUlinkState, type: CUjitInputType, path:cstring, numOptions: c.uint, options: [^]CUjit_option, optionValues: [^]rawptr) -> CUresult ---
    cuMemHostRegister_v2 :: proc(p: rawptr, bytesize: c.size_t, Flags: bit_set[CU_MEMHOSTREGISTER; c.uint]) -> CUresult ---
    cuGraphicsResourceSetMapFlags_v2 :: proc(resource: CUgraphicsResource, flags: CUgraphicsMapResourceFlags) -> CUresult ---
    cuGetErrorName :: proc(error: CUresult, pStr: ^cstring) -> CUresult ---
    cuDriverGetVersion :: proc(driverVersion: ^c.int) -> CUresult ---
    cuDeviceGetName :: proc(name: [^]c.char, len: c.int, dev: CUdevice) -> CUresult ---
    cuDeviceGetUuid :: proc(uuid: ^CUuuid, dev: CUdevice) -> CUresult ---
    cuDeviceGetUuid_v2 :: proc(uuid: ^CUuuid, dev: CUdevice) -> CUresult ---
    cuDeviceGetLuid :: proc(luid: ^[8]c.char, deviceNodeMask: ^c.uint, dev: CUdevice) -> CUresult ---
    cuDeviceTotalMem_v2 :: proc(bytes: ^c.size_t, dev: CUdevice) -> CUresult ---
    cuDeviceGetTexture1DLinearMaxWidth :: proc(maxWidthInElements: ^c.size_t, format: CUarray_format, numChannels: c.uint, dev: CUdevice) -> CUresult ---
    cuDeviceGetAttribute :: proc(pi: ^c.int, attrib: CUdevice_attribute, dev: CUdevice) -> CUresult ---
    cuDeviceGetNvSciSyncAttributes :: proc(nvSciSyncAttrList: rawptr, dev: CUdevice, flags: c.int) -> CUresult ---
    cuDeviceSetMemPool :: proc(dev: CUdevice, pool: CUmemoryPool) -> CUresult ---
    cuDeviceGetMemPool :: proc(pool: ^CUmemoryPool, dev: CUdevice) -> CUresult ---
    cuDeviceGetDefaultMemPool :: proc(pool_out: ^CUmemoryPool, dev: CUdevice) -> CUresult ---
    cuFlushGPUDirectRDMAWrites :: proc(target: CUflushGPUDirectRDMAWritesTarget, scope: CUflushGPUDirectRDMAWritesScope) -> CUresult ---
    cuDevicePrimaryCtxRetain :: proc(pctx: ^CUcontext, dev: CUdevice) -> CUresult ---
    cuDevicePrimaryCtxRelease_v2 :: proc(dev: CUdevice) -> CUresult ---
    cuDevicePrimaryCtxSetFlags_v2 :: proc(dev: CUdevice, flags: c.uint) -> CUresult ---
    cuDevicePrimaryCtxGetState :: proc(dev: CUdevice, flags: ^c.uint, active: ^c.int) -> CUresult ---
    cuDevicePrimaryCtxReset_v2 :: proc(dev: CUdevice) -> CUresult ---
    cuDeviceGetExecAffinitySupport :: proc(pi: ^c.int, type: CUexecAffinityType, dev: CUdevice) -> CUresult ---
    cuCtxCreate_v3 :: proc(pctx: ^CUcontext, paramsArray: [^]CUexecAffinityParam, numParams: c.int, flags: c.uint, dev: CUdevice) -> CUresult ---
    cuCtxDestroy_v2 :: proc(ctx: CUcontext) -> CUresult ---
    cuCtxPushCurrent_v2 :: proc(ctx: CUcontext) -> CUresult ---
    cuCtxPopCurrent_v2 :: proc(pctx: ^CUcontext) -> CUresult ---
    cuCtxSetCurrent :: proc(ctx: CUcontext) -> CUresult ---
    cuCtxGetCurrent :: proc(pctx: ^CUcontext) -> CUresult ---
    cuCtxGetDevice :: proc(device: ^CUdevice) -> CUresult ---
    cuCtxGetFlags :: proc(flags: ^c.uint) -> CUresult ---
    cuCtxSynchronize :: proc() -> CUresult ---
    cuCtxSetLimit :: proc(limit: CUlimit, value: c.size_t) -> CUresult ---
    cuCtxGetLimit :: proc(pvalue: ^c.size_t, limit: CUlimit) -> CUresult ---
    cuCtxGetCacheConfig :: proc(pconfig: ^CUfunc_cache) -> CUresult ---
    cuCtxSetCacheConfig :: proc(config: CUfunc_cache) -> CUresult ---
    cuCtxGetSharedMemConfig :: proc(pConfig: ^CUsharedconfig) -> CUresult ---
    cuCtxSetSharedMemConfig :: proc(config: CUsharedconfig) -> CUresult ---
    cuCtxGetApiVersion :: proc(ctx: CUcontext, version: ^c.uint) -> CUresult ---
    cuCtxGetStreamPriorityRange :: proc(leastPriority: ^c.int, greatestPriority: ^c.int) -> CUresult ---
    cuCtxResetPersistingL2Cache :: proc() -> CUresult ---
    cuCtxGetExecAffinity :: proc(pExecAffinity: ^CUexecAffinityParam, type: CUexecAffinityType) -> CUresult ---
    cuLinkAddFile_v2 :: proc(state: CUlinkState, type: CUjitInputType, path: cstring, numOptions: c.uint, options: [^]CUjit_option, optionValues: [^]rawptr) -> CUresult ---
    cuLinkComplete :: proc(state: CUlinkState, cubinOut: ^rawptr, sizeOut: ^c.size_t) -> CUresult ---
    cuLinkDestroy :: proc(state: CUlinkState) -> CUresult ---
    cuMemFreeHost :: proc(p: rawptr) -> CUresult ---
    cuMemHostAlloc :: proc(pp: ^rawptr, bytesize: c.size_t, Flags: c.uint) -> CUresult ---
    cuMemHostGetFlags :: proc(pFlags: ^c.uint, p: rawptr) -> CUresult ---
    cuMemAllocManaged :: proc(dptr: ^CUdeviceptr, bytesize: c.size_t, flags: bit_set[CUmemAttach; c.int]) -> CUresult ---
    cuDeviceGetByPCIBusId :: proc(dev: ^CUdevice, pciBusId: cstring) -> CUresult ---
    cuDeviceGetPCIBusId :: proc(pciBusId: cstring, len: c.int, dev: CUdevice) -> CUresult ---
    cuIpcGetEventHandle :: proc(pHandle: ^CUipcEventHandle, event: CUevent) -> CUresult ---
    cuIpcOpenEventHandle :: proc(phEvent: ^CUevent, handle: CUipcEventHandle) -> CUresult ---
    cuIpcGetMemHandle :: proc(pHandle: ^CUipcMemHandle, dptr: CUdeviceptr) -> CUresult ---
    cuIpcOpenMemHandle_v2 :: proc(pdptr: ^CUdeviceptr, handle: CUipcMemHandle, Flags: c.uint) -> CUresult ---
    cuIpcCloseMemHandle :: proc(dptr: CUdeviceptr) -> CUresult ---
    cuMemHostUnregister :: proc(p: rawptr) -> CUresult ---
    cuMemcpy :: proc(dst: CUdeviceptr, src: CUdeviceptr, ByteCount: c.size_t) -> CUresult ---
    cuMemcpyPeer :: proc(dstDevice: CUdeviceptr, dstContext: CUcontext, srcDevice: CUdeviceptr, srcContext: CUcontext, ByteCount: c.size_t) -> CUresult ---
    cuMemcpy2D_v2 :: proc(pCopy: ^CUDA_MEMCPY2D) -> CUresult ---
    cuMemcpy2DUnaligned_v2 :: proc(pCopy: ^CUDA_MEMCPY2D) -> CUresult ---
    cuMemcpy3D_v2 :: proc(pCopy: ^CUDA_MEMCPY3D) -> CUresult ---
    cuMemcpy3DPeer :: proc(pCopy: ^CUDA_MEMCPY3D_PEER) -> CUresult ---
    cuMemcpyPeerAsync :: proc(dstDevice: CUdeviceptr, dstContext: CUcontext, srcDevice: CUdeviceptr, srcContext: CUcontext, ByteCount: c.size_t, hStream: CUstream) -> CUresult ---
    cuMemcpy2DAsync_v2 :: proc(pCopy: ^CUDA_MEMCPY2D, hStream: CUstream) -> CUresult ---
    cuMemcpy3DAsync_v2 :: proc(pCopy: ^CUDA_MEMCPY3D, hStream: CUstream) -> CUresult ---
    cuMemcpy3DPeerAsync :: proc(pCopy: ^CUDA_MEMCPY3D_PEER, hStream: CUstream) -> CUresult ---
    cuArrayGetSparseProperties :: proc(sparseProperties: ^CUDA_ARRAY_SPARSE_PROPERTIES, array: CUarray) -> CUresult ---
    cuMipmappedArrayGetSparseProperties :: proc(sparseProperties: ^CUDA_ARRAY_SPARSE_PROPERTIES, mipmap: CUmipmappedArray) -> CUresult ---
    cuArrayGetPlane :: proc(pPlaneArray: ^CUarray, hArray: CUarray, planeIdx: c.uint) -> CUresult ---
    cuArrayDestroy :: proc(hArray: CUarray) -> CUresult ---
    cuMipmappedArrayCreate :: proc(pHandle: ^CUmipmappedArray, pMipmappedArrayDesc: ^CUDA_ARRAY3D_DESCRIPTOR, numMipmapLevels: c.uint) -> CUresult ---
    cuMipmappedArrayGetLevel :: proc(pLevelArray: ^CUarray, hMipmappedArray: CUmipmappedArray, level: c.uint) -> CUresult ---
    cuMipmappedArrayDestroy :: proc(hMipmappedArray: CUmipmappedArray) -> CUresult ---
    cuMemAddressReserve :: proc(ptr: ^CUdeviceptr, size: c.size_t, alignment: c.size_t, addr: CUdeviceptr, flags: c.ulonglong) -> CUresult ---
    cuMemAddressFree :: proc(ptr: CUdeviceptr, size: c.size_t) -> CUresult ---
    cuMemCreate :: proc(handle: ^CUmemGenericAllocationHandle, size: c.size_t, prop: ^CUmemAllocationProp, flags: c.ulonglong) -> CUresult ---
    cuMemRelease :: proc(handle: CUmemGenericAllocationHandle) -> CUresult ---
    cuMemMap :: proc(ptr: CUdeviceptr, size: c.size_t, offset: c.size_t, handle: CUmemGenericAllocationHandle, flags: c.ulonglong) -> CUresult ---
    cuMemMapArrayAsync :: proc(mapInfoList: ^CUarrayMapInfo, count: c.uint, hStream: CUstream) -> CUresult ---
    cuMemUnmap :: proc(ptr: CUdeviceptr, size: c.size_t) -> CUresult ---
    cuMemSetAccess :: proc(ptr: CUdeviceptr, size: c.size_t, desc: ^CUmemAccessDesc, count: c.size_t) -> CUresult ---
    cuMemGetAccess :: proc(flags: ^c.ulonglong, location: ^CUmemLocation, ptr: CUdeviceptr) -> CUresult ---
    cuMemExportToShareableHandle :: proc(shareableHandle: rawptr, handle: CUmemGenericAllocationHandle, handleType: CUmemAllocationHandleType, flags: c.ulonglong) -> CUresult ---
    cuMemImportFromShareableHandle :: proc(handle: ^CUmemGenericAllocationHandle, osHandle: rawptr, shHandleType: CUmemAllocationHandleType) -> CUresult ---
    cuMemGetAllocationGranularity :: proc(granularity: ^c.size_t, prop: ^CUmemAllocationProp, option: CUmemAllocationGranularity_flags) -> CUresult ---
    cuMemGetAllocationPropertiesFromHandle :: proc(prop: ^CUmemAllocationProp, handle: CUmemGenericAllocationHandle) -> CUresult ---
    cuMemRetainAllocationHandle :: proc(handle: ^CUmemGenericAllocationHandle, addr: rawptr) -> CUresult ---
    cuMemPoolTrimTo :: proc(pool: CUmemoryPool, minBytesToKeep: c.size_t) -> CUresult ---
    cuMemPoolSetAttribute :: proc(pool: CUmemoryPool, attr: CUmemPool_attribute, value: rawptr) -> CUresult ---
    cuMemPoolGetAttribute :: proc(pool: CUmemoryPool, attr: CUmemPool_attribute, value: rawptr) -> CUresult ---
    cuMemPoolSetAccess :: proc(pool: CUmemoryPool, _map: ^CUmemAccessDesc, count: c.size_t) -> CUresult ---
    cuMemPoolGetAccess :: proc(flags: ^CUmemAccess_flags, memPool: CUmemoryPool, location: ^CUmemLocation) -> CUresult ---
    cuMemPoolCreate :: proc(pool: ^CUmemoryPool, poolProps: ^CUmemPoolProps) -> CUresult ---
    cuMemPoolDestroy :: proc(pool: CUmemoryPool) -> CUresult ---
    cuMemAllocFromPoolAsync :: proc(dptr: ^CUdeviceptr, bytesize: c.size_t, pool: CUmemoryPool, hStream: CUstream) -> CUresult ---
    cuMemPoolExportToShareableHandle :: proc(handle_out: rawptr, pool: CUmemoryPool, handleType: CUmemAllocationHandleType, flags: c.ulonglong) -> CUresult ---
    cuMemPoolImportFromShareableHandle :: proc(pool_out: ^CUmemoryPool, handle: rawptr, handleType: CUmemAllocationHandleType, flags: c.ulonglong) -> CUresult ---
    cuMemPoolExportPointer :: proc(shareData_out: ^CUmemPoolPtrExportData, ptr: CUdeviceptr) -> CUresult ---
    cuMemPoolImportPointer :: proc(ptr_out: ^CUdeviceptr, pool: CUmemoryPool, shareData: ^CUmemPoolPtrExportData) -> CUresult ---
    cuPointerGetAttribute :: proc(data: rawptr, attribute: CUpointer_attribute, ptr: CUdeviceptr) -> CUresult ---
    cuMemPrefetchAsync :: proc(devPtr: CUdeviceptr, count: c.size_t, dstDevice: CUdevice, hStream: CUstream) -> CUresult ---
    cuMemAdvise :: proc(devPtr: CUdeviceptr, count: c.size_t, advice: CUmem_advise, device: CUdevice) -> CUresult ---
    cuMemRangeGetAttribute :: proc(data: rawptr, dataSize: c.size_t, attribute: CUmem_range_attribute, devPtr: CUdeviceptr, count: c.size_t) -> CUresult ---
    cuMemRangeGetAttributes :: proc(data: ^rawptr, dataSizes: ^c.size_t, attributes: ^CUmem_range_attribute, numAttributes: c.size_t, devPtr: CUdeviceptr, count: c.size_t) -> CUresult ---
    cuPointerSetAttribute :: proc(value: rawptr, attribute: CUpointer_attribute, ptr: CUdeviceptr) -> CUresult ---
    cuPointerGetAttributes :: proc(numAttributes: c.uint, attributes: ^CUpointer_attribute, data: ^rawptr, ptr: CUdeviceptr) -> CUresult ---
    cuStreamCreateWithPriority :: proc(phStream: ^CUstream, flags: c.uint, priority: c.int) -> CUresult ---
    cuStreamGetPriority :: proc(hStream: CUstream, priority: ^c.int) -> CUresult ---
    cuStreamGetFlags :: proc(hStream: CUstream, flags: ^c.uint) -> CUresult ---
    cuStreamGetCtx :: proc(hStream: CUstream, pctx: ^CUcontext) -> CUresult ---
    cuStreamWaitEvent :: proc(hStream: CUstream, hEvent: CUevent, Flags: c.uint) -> CUresult ---
    cuStreamAddCallback :: proc(hStream: CUstream, callback: proc "c" (CUstream, CUresult, rawptr), userData: rawptr, flags: c.uint) -> CUresult ---
    cuThreadExchangeStreamCaptureMode :: proc(mode: ^CUstreamCaptureMode) -> CUresult ---
    cuStreamUpdateCaptureDependencies :: proc(hStream: CUstream, dependencies: ^CUgraphNode, numDependencies: c.size_t, flags: c.uint) -> CUresult ---
    cuStreamAttachMemAsync :: proc(hStream: CUstream, dptr: CUdeviceptr, length: c.size_t, flags: c.uint) -> CUresult ---
    cuStreamQuery :: proc(hStream: CUstream) -> CUresult ---
    cuStreamDestroy_v2 :: proc(hStream: CUstream) -> CUresult ---
    cuEventCreate :: proc(phEvent: ^CUevent, Flags: CUevent_flags) -> CUresult ---
    cuEventRecord :: proc(hEvent: CUevent, hStream: CUstream) -> CUresult ---
    cuEventRecordWithFlags :: proc(hEvent: CUevent, hStream: CUstream, flags: c.uint) -> CUresult ---
    cuEventQuery :: proc(hEvent: CUevent) -> CUresult ---
    cuEventSynchronize :: proc(hEvent: CUevent) -> CUresult ---
    cuEventElapsedTime :: proc(pMilliseconds: ^f32, hStart: CUevent, hEnd: CUevent) -> CUresult ---
    cuImportExternalMemory :: proc(extMem_out: ^CUexternalMemory, memHandleDesc: ^CUDA_EXTERNAL_MEMORY_HANDLE_DESC) -> CUresult ---
    cuExternalMemoryGetMappedBuffer :: proc(devPtr: ^CUdeviceptr, extMem: CUexternalMemory, bufferDesc: ^CUDA_EXTERNAL_MEMORY_BUFFER_DESC) -> CUresult ---
    cuExternalMemoryGetMappedMipmappedArray :: proc(mipmap: ^CUmipmappedArray, extMem: CUexternalMemory, mipmapDesc: ^CUDA_EXTERNAL_MEMORY_MIPMAPPED_ARRAY_DESC) -> CUresult ---
    cuDestroyExternalMemory :: proc(extMem: CUexternalMemory) -> CUresult ---
    cuImportExternalSemaphore :: proc(extSem_out: ^CUexternalSemaphore, semHandleDesc: ^CUDA_EXTERNAL_SEMAPHORE_HANDLE_DESC) -> CUresult ---
    cuSignalExternalSemaphoresAsync :: proc(extSemArray: [^]CUexternalSemaphore, paramsArray: [^]CUDA_EXTERNAL_SEMAPHORE_SIGNAL_PARAMS, numExtSems: c.uint, stream: CUstream) -> CUresult ---
    cuWaitExternalSemaphoresAsync :: proc(extSemArray: [^]CUexternalSemaphore, paramsArray: [^]CUDA_EXTERNAL_SEMAPHORE_WAIT_PARAMS, numExtSems: c.uint, stream: CUstream) -> CUresult ---
    cuDestroyExternalSemaphore :: proc(extSem: CUexternalSemaphore) -> CUresult ---
    cuStreamWaitValue32 :: proc(stream: CUstream, addr: CUdeviceptr, value: u32, flags: c.uint) -> CUresult ---
    cuStreamWaitValue64 :: proc(stream: CUstream, addr: CUdeviceptr, value: u64, flags: c.uint) -> CUresult ---
    cuStreamWriteValue32 :: proc(stream: CUstream, addr: CUdeviceptr, value: u32, flags: c.uint) -> CUresult ---
    cuStreamWriteValue64 :: proc(stream: CUstream, addr: CUdeviceptr, value: u64, flags: c.uint) -> CUresult ---
    cuStreamBatchMemOp :: proc(stream: CUstream, count: c.uint, paramArray: [^]CUstreamBatchMemOpParams, flags: c.uint) -> CUresult ---
    cuGraphInstantiate_v2 :: proc(phGraphExec: ^CUgraphExec, hGraph: CUgraph, phErrorNode: ^CUgraphNode, logBuffer: cstring, bufferSize: c.size_t) -> CUresult ---
    cuOccupancyMaxActiveBlocksPerMultiprocessor :: proc(numBlocks: ^c.int, func: CUfunction, blockSize: c.int, dynamicSMemSize: c.size_t) -> CUresult ---
    cuOccupancyMaxActiveBlocksPerMultiprocessorWithFlags :: proc(numBlocks: ^c.int, func: CUfunction, blockSize: c.int, dynamicSMemSize: c.size_t, flags: c.uint) -> CUresult ---
    cuOccupancyMaxPotentialBlockSize :: proc(minGridSize: ^c.int, blockSize: ^c.int, func: CUfunction, blockSizeToDynamicSMemSize: proc "c" (c.int) -> c.size_t, dynamicSMemSize: c.size_t, blockSizeLimit: c.int) -> CUresult ---
    cuOccupancyMaxPotentialBlockSizeWithFlags :: proc(minGridSize: ^c.int, blockSize: ^c.int, func: CUfunction, blockSizeToDynamicSMemSize: proc "c" (c.int) -> c.size_t, dynamicSMemSize: c.size_t, blockSizeLimit: c.int, flags: c.uint) -> CUresult ---
    cuOccupancyAvailableDynamicSMemPerBlock :: proc(dynamicSmemSize: ^c.size_t, func: CUfunction, numBlocks: c.int, blockSize: c.int) -> CUresult ---
    cuTexObjectCreate :: proc(pTexObject: ^CUtexObject, pResDesc: ^CUDA_RESOURCE_DESC, pTexDesc: ^CUDA_TEXTURE_DESC, pResViewDesc: ^CUDA_RESOURCE_VIEW_DESC) -> CUresult ---
    cuTexObjectDestroy :: proc(texObject: CUtexObject) -> CUresult ---
    cuTexObjectGetResourceDesc :: proc(pResDesc: ^CUDA_RESOURCE_DESC, texObject: CUtexObject) -> CUresult ---
    cuTexObjectGetTextureDesc :: proc(pTexDesc: ^CUDA_TEXTURE_DESC, texObject: CUtexObject) -> CUresult ---
    cuTexObjectGetResourceViewDesc :: proc(pResViewDesc: ^CUDA_RESOURCE_VIEW_DESC, texObject: CUtexObject) -> CUresult ---
    cuSurfObjectCreate :: proc(pSurfObject: ^CUsurfObject, pResDesc: ^CUDA_RESOURCE_DESC) -> CUresult ---
    cuSurfObjectDestroy :: proc(surfObject: CUsurfObject) -> CUresult ---
    cuSurfObjectGetResourceDesc :: proc(pResDesc: ^CUDA_RESOURCE_DESC, surfObject: CUsurfObject) -> CUresult ---
    cuDeviceCanAccessPeer :: proc(canAccessPeer: ^c.int, dev: CUdevice, peerDev: CUdevice) -> CUresult ---
    cuCtxEnablePeerAccess :: proc(peerContext: CUcontext, Flags: c.uint) -> CUresult ---
    cuCtxDisablePeerAccess :: proc(peerContext: CUcontext) -> CUresult ---
    cuDeviceGetP2PAttribute :: proc(value: ^c.int, attrib: CUdevice_P2PAttribute, srcDevice: CUdevice, dstDevice: CUdevice) -> CUresult ---
    cuGraphicsUnregisterResource :: proc(resource: CUgraphicsResource) -> CUresult ---
    cuGraphicsSubResourceGetMappedArray :: proc(pArray: ^CUarray, resource: CUgraphicsResource, arrayIndex: c.uint, mipLevel: c.uint) -> CUresult ---
    cuGraphicsResourceGetMappedMipmappedArray :: proc(pMipmappedArray: ^CUmipmappedArray, resource: CUgraphicsResource) -> CUresult ---
    cuGraphicsMapResources :: proc(count: c.uint, resources: [^]CUgraphicsResource, hStream: CUstream) -> CUresult ---
    cuGraphicsUnmapResources :: proc(count: c.uint, resources: [^]CUgraphicsResource, hStream: CUstream) -> CUresult ---
    cuGetProcAddress :: proc(symbol: cstring, pfn: ^rawptr, cudaVersion: c.int, flags: u64) -> CUresult ---
    cuGetExportTable :: proc(ppExportTable: ^rawptr, pExportTableId: ^CUuuid) -> CUresult ---
}

EGLImageKHR :: rawptr
EGLStreamKHR :: rawptr
CUeglStreamConnection :: distinct rawptr
CUeglResourceLocationFlags :: enum c.int {
        CU_EGL_RESOURCE_LOCATION_SYSMEM   = 0x00,
        CU_EGL_RESOURCE_LOCATION_VIDMEM   = 0x01
}
MAX_PLANES :: 3
CUeglFrameType :: enum c.int {
        CU_EGL_FRAME_TYPE_ARRAY = 0,
        CU_EGL_FRAME_TYPE_PITCH = 1,
}

CUeglColorFormat :: enum c.int {
    CU_EGL_COLOR_FORMAT_YUV420_PLANAR              = 0x00,      CU_EGL_COLOR_FORMAT_YUV420_SEMIPLANAR          = 0x01,      CU_EGL_COLOR_FORMAT_YUV422_PLANAR              = 0x02,      CU_EGL_COLOR_FORMAT_YUV422_SEMIPLANAR          = 0x03,      CU_EGL_COLOR_FORMAT_RGB                        = 0x04,      CU_EGL_COLOR_FORMAT_BGR                        = 0x05,      CU_EGL_COLOR_FORMAT_ARGB                       = 0x06,      CU_EGL_COLOR_FORMAT_RGBA                       = 0x07,      CU_EGL_COLOR_FORMAT_L                          = 0x08,      CU_EGL_COLOR_FORMAT_R                          = 0x09,      CU_EGL_COLOR_FORMAT_YUV444_PLANAR              = 0x0A,      CU_EGL_COLOR_FORMAT_YUV444_SEMIPLANAR          = 0x0B,      CU_EGL_COLOR_FORMAT_YUYV_422                   = 0x0C,      CU_EGL_COLOR_FORMAT_UYVY_422                   = 0x0D,      CU_EGL_COLOR_FORMAT_ABGR                       = 0x0E,      CU_EGL_COLOR_FORMAT_BGRA                       = 0x0F,      CU_EGL_COLOR_FORMAT_A                          = 0x10,      CU_EGL_COLOR_FORMAT_RG                         = 0x11,      CU_EGL_COLOR_FORMAT_AYUV                       = 0x12,      CU_EGL_COLOR_FORMAT_YVU444_SEMIPLANAR          = 0x13,      CU_EGL_COLOR_FORMAT_YVU422_SEMIPLANAR          = 0x14,      CU_EGL_COLOR_FORMAT_YVU420_SEMIPLANAR          = 0x15,      CU_EGL_COLOR_FORMAT_Y10V10U10_444_SEMIPLANAR   = 0x16,      CU_EGL_COLOR_FORMAT_Y10V10U10_420_SEMIPLANAR   = 0x17,      CU_EGL_COLOR_FORMAT_Y12V12U12_444_SEMIPLANAR   = 0x18,      CU_EGL_COLOR_FORMAT_Y12V12U12_420_SEMIPLANAR   = 0x19,      CU_EGL_COLOR_FORMAT_VYUY_ER                    = 0x1A,      CU_EGL_COLOR_FORMAT_UYVY_ER                    = 0x1B,      CU_EGL_COLOR_FORMAT_YUYV_ER                    = 0x1C,      CU_EGL_COLOR_FORMAT_YVYU_ER                    = 0x1D,      CU_EGL_COLOR_FORMAT_YUV_ER                     = 0x1E,      CU_EGL_COLOR_FORMAT_YUVA_ER                    = 0x1F,      CU_EGL_COLOR_FORMAT_AYUV_ER                    = 0x20,      CU_EGL_COLOR_FORMAT_YUV444_PLANAR_ER           = 0x21,      CU_EGL_COLOR_FORMAT_YUV422_PLANAR_ER           = 0x22,      CU_EGL_COLOR_FORMAT_YUV420_PLANAR_ER           = 0x23,      CU_EGL_COLOR_FORMAT_YUV444_SEMIPLANAR_ER       = 0x24,      CU_EGL_COLOR_FORMAT_YUV422_SEMIPLANAR_ER       = 0x25,      CU_EGL_COLOR_FORMAT_YUV420_SEMIPLANAR_ER       = 0x26,      CU_EGL_COLOR_FORMAT_YVU444_PLANAR_ER           = 0x27,      CU_EGL_COLOR_FORMAT_YVU422_PLANAR_ER           = 0x28,      CU_EGL_COLOR_FORMAT_YVU420_PLANAR_ER           = 0x29,      CU_EGL_COLOR_FORMAT_YVU444_SEMIPLANAR_ER       = 0x2A,      CU_EGL_COLOR_FORMAT_YVU422_SEMIPLANAR_ER       = 0x2B,      CU_EGL_COLOR_FORMAT_YVU420_SEMIPLANAR_ER       = 0x2C,      CU_EGL_COLOR_FORMAT_BAYER_RGGB                 = 0x2D,      CU_EGL_COLOR_FORMAT_BAYER_BGGR                 = 0x2E,      CU_EGL_COLOR_FORMAT_BAYER_GRBG                 = 0x2F,      CU_EGL_COLOR_FORMAT_BAYER_GBRG                 = 0x30,      CU_EGL_COLOR_FORMAT_BAYER10_RGGB               = 0x31,      CU_EGL_COLOR_FORMAT_BAYER10_BGGR               = 0x32,      CU_EGL_COLOR_FORMAT_BAYER10_GRBG               = 0x33,      CU_EGL_COLOR_FORMAT_BAYER10_GBRG               = 0x34,      CU_EGL_COLOR_FORMAT_BAYER12_RGGB               = 0x35,      CU_EGL_COLOR_FORMAT_BAYER12_BGGR               = 0x36,      CU_EGL_COLOR_FORMAT_BAYER12_GRBG               = 0x37,      CU_EGL_COLOR_FORMAT_BAYER12_GBRG               = 0x38,      CU_EGL_COLOR_FORMAT_BAYER14_RGGB               = 0x39,      CU_EGL_COLOR_FORMAT_BAYER14_BGGR               = 0x3A,      CU_EGL_COLOR_FORMAT_BAYER14_GRBG               = 0x3B,      CU_EGL_COLOR_FORMAT_BAYER14_GBRG               = 0x3C,      CU_EGL_COLOR_FORMAT_BAYER20_RGGB               = 0x3D,      CU_EGL_COLOR_FORMAT_BAYER20_BGGR               = 0x3E,      CU_EGL_COLOR_FORMAT_BAYER20_GRBG               = 0x3F,      CU_EGL_COLOR_FORMAT_BAYER20_GBRG               = 0x40,      CU_EGL_COLOR_FORMAT_YVU444_PLANAR              = 0x41,      CU_EGL_COLOR_FORMAT_YVU422_PLANAR              = 0x42,      CU_EGL_COLOR_FORMAT_YVU420_PLANAR              = 0x43,      CU_EGL_COLOR_FORMAT_BAYER_ISP_RGGB             = 0x44,      CU_EGL_COLOR_FORMAT_BAYER_ISP_BGGR             = 0x45,      CU_EGL_COLOR_FORMAT_BAYER_ISP_GRBG             = 0x46,      CU_EGL_COLOR_FORMAT_BAYER_ISP_GBRG             = 0x47,      CU_EGL_COLOR_FORMAT_BAYER_BCCR                 = 0x48,      CU_EGL_COLOR_FORMAT_BAYER_RCCB                 = 0x49,      CU_EGL_COLOR_FORMAT_BAYER_CRBC                 = 0x4A,      CU_EGL_COLOR_FORMAT_BAYER_CBRC                 = 0x4B,      CU_EGL_COLOR_FORMAT_BAYER10_CCCC               = 0x4C,      CU_EGL_COLOR_FORMAT_BAYER12_BCCR               = 0x4D,      CU_EGL_COLOR_FORMAT_BAYER12_RCCB               = 0x4E,      CU_EGL_COLOR_FORMAT_BAYER12_CRBC               = 0x4F,      CU_EGL_COLOR_FORMAT_BAYER12_CBRC               = 0x50,      CU_EGL_COLOR_FORMAT_BAYER12_CCCC               = 0x51,      CU_EGL_COLOR_FORMAT_Y                          = 0x52,     CU_EGL_COLOR_FORMAT_YUV420_SEMIPLANAR_2020     = 0x53,     CU_EGL_COLOR_FORMAT_YVU420_SEMIPLANAR_2020     = 0x54,     CU_EGL_COLOR_FORMAT_YUV420_PLANAR_2020         = 0x55,     CU_EGL_COLOR_FORMAT_YUV420_SEMIPLANAR_709      = 0x57,     CU_EGL_COLOR_FORMAT_YVU420_SEMIPLANAR_709      = 0x58,     CU_EGL_COLOR_FORMAT_YUV420_PLANAR_709          = 0x59,     CU_EGL_COLOR_FORMAT_YVU420_PLANAR_709          = 0x5A,      CU_EGL_COLOR_FORMAT_Y10V10U10_420_SEMIPLANAR_709  = 0x5B,     CU_EGL_COLOR_FORMAT_Y10V10U10_420_SEMIPLANAR_2020 = 0x5C,     CU_EGL_COLOR_FORMAT_Y10V10U10_422_SEMIPLANAR_2020 = 0x5D,     CU_EGL_COLOR_FORMAT_Y10V10U10_422_SEMIPLANAR      = 0x5E,     CU_EGL_COLOR_FORMAT_Y10V10U10_422_SEMIPLANAR_709  = 0x5F,     CU_EGL_COLOR_FORMAT_Y_ER                          = 0x60,     CU_EGL_COLOR_FORMAT_Y_709_ER                      = 0x61,     CU_EGL_COLOR_FORMAT_Y10_ER                        = 0x62,     CU_EGL_COLOR_FORMAT_Y10_709_ER                    = 0x63,     CU_EGL_COLOR_FORMAT_Y12_ER                        = 0x64,     CU_EGL_COLOR_FORMAT_Y12_709_ER                    = 0x65,     CU_EGL_COLOR_FORMAT_YUVA                          = 0x66,     CU_EGL_COLOR_FORMAT_YUV                           = 0x67,     CU_EGL_COLOR_FORMAT_YVYU                          = 0x68,     CU_EGL_COLOR_FORMAT_VYUY                          = 0x69,     CU_EGL_COLOR_FORMAT_Y10V10U10_420_SEMIPLANAR_ER     = 0x6A,     CU_EGL_COLOR_FORMAT_Y10V10U10_420_SEMIPLANAR_709_ER = 0x6B,     CU_EGL_COLOR_FORMAT_Y10V10U10_444_SEMIPLANAR_ER     = 0x6C,     CU_EGL_COLOR_FORMAT_Y12V12U12_420_SEMIPLANAR_ER     = 0x6E,     CU_EGL_COLOR_FORMAT_Y12V12U12_444_SEMIPLANAR_ER     = 0x70,     CU_EGL_COLOR_FORMAT_UYVY_709                        = 0x72,     CU_EGL_COLOR_FORMAT_UYVY_709_ER                     = 0x73,     CU_EGL_COLOR_FORMAT_UYVY_2020                       = 0x74,     CU_EGL_COLOR_FORMAT_MAX
}

CUeglFrame :: struct {
    frame: struct #raw_union {
                pArray: [MAX_PLANES]CUarray,
                pPitch: [MAX_PLANES]rawptr,
    },
        width: c.uint,
        height: c.uint,
        depth: c.uint,
        pitch: c.uint,
        planeCount: c.uint,
        numChannels: c.uint,
        frameType: CUeglFrameType,
        eglColorFormat: CUeglColorFormat,
        cuFormat: CUarray_format,
}

CUgraphicsRegisterFlags :: enum c.uint { 
    READ_ONLY,
    WRITE_DISCARD,
    SURFACE_LDST,
    TEXTURE_GATHER,
}

//Not part of cuda.h
@(default_calling_convention = "stdcall" when (ODIN_OS == .Windows) else "c")
foreign lib {
    cuGraphicsEGLRegisterImage                           :: proc(pCudaResource: ^CUgraphicsResource, image: EGLImageKHR, flags:CUgraphicsMapResourceFlags) -> CUresult ---                                        
    cuEGLStreamConsumerConnect                           :: proc(conn: ^CUeglStreamConnection, stream: EGLStreamKHR) -> CUresult ---
    cuEGLStreamConsumerConnectWithFlags                  :: proc(conn: ^CUeglStreamConnection, stream: EGLStreamKHR, flags: CUeglResourceLocationFlags) -> CUresult ---
    cuEGLStreamConsumerDisconnect                        :: proc(conn: ^CUeglStreamConnection) -> CUresult ---
    cuEGLStreamConsumerAcquireFrame                      :: proc(conn: ^CUeglStreamConnection, pCudaResource: ^CUgraphicsResource, pStream: ^CUstream, timeout_micros: c.uint) -> CUresult ---
    cuEGLStreamConsumerReleaseFrame                      :: proc(conn: ^CUeglStreamConnection, pCudaResource: CUgraphicsResource, pStream: ^CUstream) -> CUresult ---
    cuEGLStreamProducerConnect                           :: proc(conn: ^CUeglStreamConnection, stream: EGLStreamKHR, width, height: i32) -> CUresult ---
    cuEGLStreamProducerDisconnect                        :: proc(conn: ^CUeglStreamConnection) -> CUresult ---
    cuEGLStreamProducerPresentFrame                      :: proc(conn: ^CUeglStreamConnection, eglframe: CUeglFrame, pStream: ^CUstream) -> CUresult ---
    cuEGLStreamProducerReturnFrame                       :: proc(conn: ^CUeglStreamConnection, eglframe: ^CUeglFrame, pStream: ^CUstream) -> CUresult ---
    cuGraphicsResourceGetMappedEglFrame                  :: proc(eglframe: ^CUeglFrame, resource: CUgraphicsResource, index: c.uint, mipLevel: c.uint) -> CUresult ---
    cuGraphicsGLRegisterBuffer                           :: proc(pCudaResource: ^CUgraphicsResource, buffer: u32, flags: bit_set[CUgraphicsRegisterFlags; c.uint]) -> CUresult ---
    cuGraphicsGLRegisterImage                            :: proc(pCudaResource: ^CUgraphicsResource, image: u32, target_GLenum: i32, flags: bit_set[CUgraphicsRegisterFlags; c.uint]) -> CUresult ---
}

enable_formatting :: proc "odin" () {
    fmt.register_user_formatter(type_info_of(CUdeviceptr).id, proc(info: ^fmt.Info, arg: any, format: rune) -> bool {
        switch v in arg {
            case CUdeviceptr:
                switch format {
                    case 'x': fallthrough
                    case 'p':
                        io.write_string(info.writer, fmt.tprintf("&device[%x]", uint(v)))
                        return true
                    case 'X': fallthrough
                    case 'P': fallthrough
                    case 'V': fallthrough
                    case 'v':
                        io.write_string(info.writer, fmt.tprintf("&device[%X]", uint(v)))
                        return true
                    case 'd': fallthrough
                    case 'D':
                        io.write_string(info.writer, fmt.tprintf("&device[%d]", uint(v)))
                        return true
                }
        }
        return false
    })
}