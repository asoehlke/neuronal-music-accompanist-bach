node {
  name: "input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
      }
    }
  }
}
node {
  name: "init_states"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 2
        }
        dim {
          size: 1
        }
        dim {
          size: 300
        }
      }
    }
  }
}
node {
  name: "Cast"
  op: "Cast"
  input: "input"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice"
  op: "StridedSlice"
  input: "input"
  input: "strided_slice/stack"
  input: "strided_slice/stack_1"
  input: "strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 59
      }
    }
  }
}
node {
  name: "sub"
  op: "Sub"
  input: "strided_slice"
  input: "sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "one_hot/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "one_hot/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "one_hot/depth"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 26
      }
    }
  }
}
node {
  name: "one_hot/on_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "one_hot/off_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "one_hot"
  op: "OneHot"
  input: "sub"
  input: "one_hot/depth"
  input: "one_hot/on_value"
  input: "one_hot/off_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "TI"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: -1
    }
  }
}
node {
  name: "strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1"
  op: "StridedSlice"
  input: "Cast"
  input: "strided_slice_1/stack"
  input: "strided_slice_1/stack_1"
  input: "strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "concat/values_1"
  op: "Pack"
  input: "strided_slice_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "concat"
  op: "ConcatV2"
  input: "one_hot"
  input: "concat/values_1"
  input: "concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\033\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape"
  op: "Reshape"
  input: "concat"
  input: "Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "split/split_dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "split"
  op: "Split"
  input: "split/split_dim"
  input: "init_states"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 3
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "split_1/split_dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "split_1"
  op: "Split"
  input: "split_1/split_dim"
  input: "split"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 2
    }
  }
}
node {
  name: "Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_1"
  op: "Reshape"
  input: "split_1"
  input: "Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_2/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_2"
  op: "Reshape"
  input: "split_1:1"
  input: "Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "split_2/split_dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "split_2"
  op: "Split"
  input: "split_2/split_dim"
  input: "split:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 2
    }
  }
}
node {
  name: "Reshape_3/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_3"
  op: "Reshape"
  input: "split_2"
  input: "Reshape_3/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_4/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_4"
  op: "Reshape"
  input: "split_2:1"
  input: "Reshape_4/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "split_3/split_dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "split_3"
  op: "Split"
  input: "split_3/split_dim"
  input: "split:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 2
    }
  }
}
node {
  name: "Reshape_5/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_5"
  op: "Reshape"
  input: "split_3"
  input: "Reshape_5/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_6/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\377\377\377\377"
      }
    }
  }
}
node {
  name: "Reshape_6"
  op: "Reshape"
  input: "split_3:1"
  input: "Reshape_6/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "range"
  op: "Range"
  input: "range/start"
  input: "Rank"
  input: "range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "concat_1/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "concat_1"
  op: "ConcatV2"
  input: "concat_1/values_0"
  input: "range"
  input: "concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "transpose"
  op: "Transpose"
  input: "Reshape"
  input: "concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\033\000\000\000"
      }
    }
  }
}
node {
  name: "rnn/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/strided_slice"
  op: "StridedSlice"
  input: "rnn/Shape"
  input: "rnn/strided_slice/stack"
  input: "rnn/strided_slice/stack_1"
  input: "rnn/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "rnn/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/concat"
  op: "ConcatV2"
  input: "rnn/Const"
  input: "rnn/Const_1"
  input: "rnn/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "rnn/zeros"
  op: "Fill"
  input: "rnn/concat"
  input: "rnn/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/time"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/TensorArray"
  op: "TensorArrayV3"
  input: "rnn/strided_slice"
  attr {
    key: "clear_after_read"
    value {
      b: true
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "dynamic_size"
    value {
      b: false
    }
  }
  attr {
    key: "element_shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
  attr {
    key: "tensor_array_name"
    value {
      s: "rnn/dynamic_rnn/output_0"
    }
  }
}
node {
  name: "rnn/TensorArray_1"
  op: "TensorArrayV3"
  input: "rnn/strided_slice"
  attr {
    key: "clear_after_read"
    value {
      b: true
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "dynamic_size"
    value {
      b: false
    }
  }
  attr {
    key: "element_shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
  attr {
    key: "tensor_array_name"
    value {
      s: "rnn/dynamic_rnn/input_0"
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\033\000\000\000"
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/strided_slice"
  op: "StridedSlice"
  input: "rnn/TensorArrayUnstack/Shape"
  input: "rnn/TensorArrayUnstack/strided_slice/stack"
  input: "rnn/TensorArrayUnstack/strided_slice/stack_1"
  input: "rnn/TensorArrayUnstack/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/range"
  op: "Range"
  input: "rnn/TensorArrayUnstack/range/start"
  input: "rnn/TensorArrayUnstack/strided_slice"
  input: "rnn/TensorArrayUnstack/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3"
  op: "TensorArrayScatterV3"
  input: "rnn/TensorArray_1"
  input: "rnn/TensorArrayUnstack/range"
  input: "transpose"
  input: "rnn/TensorArray_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@transpose"
      }
    }
  }
}
node {
  name: "rnn/while/Enter"
  op: "Enter"
  input: "rnn/time"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_1"
  op: "Enter"
  input: "rnn/TensorArray:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_2"
  op: "Enter"
  input: "Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_3"
  op: "Enter"
  input: "Reshape_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_4"
  op: "Enter"
  input: "Reshape_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_5"
  op: "Enter"
  input: "Reshape_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_6"
  op: "Enter"
  input: "Reshape_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Enter_7"
  op: "Enter"
  input: "Reshape_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Merge"
  op: "Merge"
  input: "rnn/while/Enter"
  input: "rnn/while/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/Merge_1"
  op: "Merge"
  input: "rnn/while/Enter_1"
  input: "rnn/while/NextIteration_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_2"
  op: "Merge"
  input: "rnn/while/Enter_2"
  input: "rnn/while/NextIteration_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_3"
  op: "Merge"
  input: "rnn/while/Enter_3"
  input: "rnn/while/NextIteration_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_4"
  op: "Merge"
  input: "rnn/while/Enter_4"
  input: "rnn/while/NextIteration_4"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_5"
  op: "Merge"
  input: "rnn/while/Enter_5"
  input: "rnn/while/NextIteration_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_6"
  op: "Merge"
  input: "rnn/while/Enter_6"
  input: "rnn/while/NextIteration_6"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Merge_7"
  op: "Merge"
  input: "rnn/while/Enter_7"
  input: "rnn/while/NextIteration_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Less/Enter"
  op: "Enter"
  input: "rnn/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/Less"
  op: "Less"
  input: "rnn/while/Merge"
  input: "rnn/while/Less/Enter"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/LoopCond"
  op: "LoopCond"
  input: "rnn/while/Less"
}
node {
  name: "rnn/while/Switch"
  op: "Switch"
  input: "rnn/while/Merge"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_1"
  op: "Switch"
  input: "rnn/while/Merge_1"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_1"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_2"
  op: "Switch"
  input: "rnn/while/Merge_2"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_2"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_3"
  op: "Switch"
  input: "rnn/while/Merge_3"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_3"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_4"
  op: "Switch"
  input: "rnn/while/Merge_4"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_4"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_5"
  op: "Switch"
  input: "rnn/while/Merge_5"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_5"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_6"
  op: "Switch"
  input: "rnn/while/Merge_6"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_6"
      }
    }
  }
}
node {
  name: "rnn/while/Switch_7"
  op: "Switch"
  input: "rnn/while/Merge_7"
  input: "rnn/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/Merge_7"
      }
    }
  }
}
node {
  name: "rnn/while/Identity"
  op: "Identity"
  input: "rnn/while/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/Identity_1"
  op: "Identity"
  input: "rnn/while/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_2"
  op: "Identity"
  input: "rnn/while/Switch_2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_3"
  op: "Identity"
  input: "rnn/while/Switch_3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_4"
  op: "Identity"
  input: "rnn/while/Switch_4:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_5"
  op: "Identity"
  input: "rnn/while/Switch_5:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_6"
  op: "Identity"
  input: "rnn/while/Switch_6:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Identity_7"
  op: "Identity"
  input: "rnn/while/Switch_7:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/TensorArrayReadV3/Enter"
  op: "Enter"
  input: "rnn/TensorArray_1"
  attr {
    key: "T"
    value {
      type: DT_RESOURCE
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/TensorArrayReadV3/Enter_1"
  op: "Enter"
  input: "rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/TensorArrayReadV3"
  op: "TensorArrayReadV3"
  input: "rnn/while/TensorArrayReadV3/Enter"
  input: "rnn/while/Identity"
  input: "rnn/while/TensorArrayReadV3/Enter_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "G\001\000\000\260\004\000\000"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.06268391758203506
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.06268391758203506
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 327
        }
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/concat"
  op: "ConcatV2"
  input: "rnn/while/TensorArrayReadV3"
  input: "rnn/while/Identity_3"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/MatMul"
  op: "MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/concat"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1200
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  op: "BiasAdd"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Const"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split/split_dim"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split"
  op: "Split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split/split_dim"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 4
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add/y"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split:2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul/Enter"
  input: "rnn/while/Identity_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_1"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_1"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid"
  input: "rnn/while/Identity_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_2/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_2"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_2/Enter"
  input: "rnn/while/Identity_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_2"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid_1"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Tanh"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_3"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_3"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_4/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_4"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_4/Enter"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_4"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/split:3"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid_2"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Tanh_1"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_5"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Sigmoid_2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000\260\004\000\000"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05773502588272095
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05773502588272095
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/concat"
  op: "ConcatV2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_5"
  input: "rnn/while/Identity_5"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/MatMul"
  op: "MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/concat"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1200
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  op: "BiasAdd"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Const"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split/split_dim"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split"
  op: "Split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split/split_dim"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 4
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add/y"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split:2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul/Enter"
  input: "rnn/while/Identity_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_1"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_1"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid"
  input: "rnn/while/Identity_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_2/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_2"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_2/Enter"
  input: "rnn/while/Identity_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_2"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid_1"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Tanh"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_3"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_3"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_4/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_4"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_4/Enter"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_4"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/split:3"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid_2"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Tanh_1"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_5"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Sigmoid_2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "X\002\000\000\260\004\000\000"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05773502588272095
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05773502588272095
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 600
        }
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/concat"
  op: "ConcatV2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_5"
  input: "rnn/while/Identity_7"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/MatMul"
  op: "MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/concat"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/MatMul/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias/Initializer/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1200
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1200
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias/Initializer/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  op: "BiasAdd"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/MatMul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/BiasAdd/Enter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Const"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split/split_dim"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split"
  op: "Split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split/split_dim"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/lstm_cell/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "num_split"
    value {
      i: 4
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  op: "Sub"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/max"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  op: "Mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/RandomUniform"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform"
  op: "Add"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/mul"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Assign"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/read"
  op: "Identity"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add/y"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split:2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul/Enter"
  input: "rnn/while/Identity_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_1"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_1"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid"
  input: "rnn/while/Identity_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_2/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_2"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_2/Enter"
  input: "rnn/while/Identity_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_2"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid_1"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Tanh"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_3"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Tanh"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_3"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_1"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_4/Enter"
  op: "Enter"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_4"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_4/Enter"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_4"
  op: "Add"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/split:3"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid_2"
  op: "Sigmoid"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Tanh_1"
  op: "Tanh"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_5"
  op: "Mul"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Sigmoid_2"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/Tanh_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter"
  op: "Enter"
  input: "rnn/TensorArray"
  attr {
    key: "T"
    value {
      type: DT_RESOURCE
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_5"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "rnn/while/rnn/while/"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 32
    }
  }
}
node {
  name: "rnn/while/TensorArrayWrite/TensorArrayWriteV3"
  op: "TensorArrayWriteV3"
  input: "rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter"
  input: "rnn/while/Identity"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_5"
  input: "rnn/while/Identity_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_5"
      }
    }
  }
}
node {
  name: "rnn/while/add/y"
  op: "Const"
  input: "^rnn/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/while/add"
  op: "Add"
  input: "rnn/while/Identity"
  input: "rnn/while/add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/NextIteration"
  op: "NextIteration"
  input: "rnn/while/add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/NextIteration_1"
  op: "NextIteration"
  input: "rnn/while/TensorArrayWrite/TensorArrayWriteV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_2"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_3"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_0/cell_0/lstm_cell/lstm_cell/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_4"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_5"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_1/cell_1/lstm_cell/lstm_cell/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_6"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/NextIteration_7"
  op: "NextIteration"
  input: "rnn/while/rnn/multi_rnn_cell/cell_2/cell_2/lstm_cell/lstm_cell/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit"
  op: "Exit"
  input: "rnn/while/Switch"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/while/Exit_1"
  op: "Exit"
  input: "rnn/while/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_2"
  op: "Exit"
  input: "rnn/while/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_3"
  op: "Exit"
  input: "rnn/while/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_4"
  op: "Exit"
  input: "rnn/while/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_5"
  op: "Exit"
  input: "rnn/while/Switch_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_6"
  op: "Exit"
  input: "rnn/while/Switch_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/while/Exit_7"
  op: "Exit"
  input: "rnn/while/Switch_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "rnn/TensorArrayStack/TensorArraySizeV3"
  op: "TensorArraySizeV3"
  input: "rnn/TensorArray"
  input: "rnn/while/Exit_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/TensorArray"
      }
    }
  }
}
node {
  name: "rnn/TensorArrayStack/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/TensorArrayStack/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/TensorArrayStack/range"
  op: "Range"
  input: "rnn/TensorArrayStack/range/start"
  input: "rnn/TensorArrayStack/TensorArraySizeV3"
  input: "rnn/TensorArrayStack/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/TensorArray"
      }
    }
  }
}
node {
  name: "rnn/TensorArrayStack/TensorArrayGatherV3"
  op: "TensorArrayGatherV3"
  input: "rnn/TensorArray"
  input: "rnn/TensorArrayStack/range"
  input: "rnn/while/Exit_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "element_shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 300
        }
      }
    }
  }
}
node {
  name: "rnn/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "rnn/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 300
      }
    }
  }
}
node {
  name: "rnn/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "rnn/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "rnn/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "rnn/range"
  op: "Range"
  input: "rnn/range/start"
  input: "rnn/Rank"
  input: "rnn/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/concat_1/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "rnn/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "rnn/concat_1"
  op: "ConcatV2"
  input: "rnn/concat_1/values_0"
  input: "rnn/range"
  input: "rnn/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "rnn/transpose"
  op: "Transpose"
  input: "rnn/TensorArrayStack/TensorArrayGatherV3"
  input: "rnn/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "final_states/0"
  op: "Pack"
  input: "rnn/while/Exit_2"
  input: "rnn/while/Exit_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states/1"
  op: "Pack"
  input: "rnn/while/Exit_4"
  input: "rnn/while/Exit_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states/2"
  op: "Pack"
  input: "rnn/while/Exit_6"
  input: "rnn/while/Exit_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states"
  op: "Pack"
  input: "final_states/0"
  input: "final_states/1"
  input: "final_states/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000N\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "truncated_normal/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal/mul"
  op: "Mul"
  input: "truncated_normal/TruncatedNormal"
  input: "truncated_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal"
  op: "Add"
  input: "truncated_normal/mul"
  input: "truncated_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 78
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "weight"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 78
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "weight/Assign"
  op: "Assign"
  input: "weight"
  input: "truncated_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "weight/read"
  op: "Identity"
  input: "weight"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight"
      }
    }
  }
}
node {
  name: "bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 78
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bias/Assign"
  op: "Assign"
  input: "bias"
  input: "Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bias/read"
  op: "Identity"
  input: "bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias"
      }
    }
  }
}
node {
  name: "Reshape_7/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377,\001\000\000"
      }
    }
  }
}
node {
  name: "Reshape_7"
  op: "Reshape"
  input: "rnn/transpose"
  input: "Reshape_7/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "MatMul"
  op: "MatMul"
  input: "Reshape_7"
  input: "weight/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "MatMul"
  input: "bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_8/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000\003\000\000\000\032\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_8"
  op: "Reshape"
  input: "add"
  input: "Reshape_8/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000\032\000\000\000"
      }
    }
  }
}
node {
  name: "Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000\032\000\000\000"
      }
    }
  }
}
node {
  name: "Sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Sub"
  op: "Sub"
  input: "Rank_1"
  input: "Sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Slice/begin"
  op: "Pack"
  input: "Sub"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "Slice"
  op: "Slice"
  input: "Shape_1"
  input: "Slice/begin"
  input: "Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "concat_2/values_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "concat_2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "concat_2"
  op: "ConcatV2"
  input: "concat_2/values_0"
  input: "Slice"
  input: "concat_2/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Reshape_9"
  op: "Reshape"
  input: "Reshape_8"
  input: "concat_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Softmax"
  op: "Softmax"
  input: "Reshape_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_10"
  op: "Reshape"
  input: "Softmax"
  input: "Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "ArgMax"
  op: "ArgMax"
  input: "Reshape_10"
  input: "ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Reshape_11/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Reshape_11"
  op: "Reshape"
  input: "ArgMax"
  input: "Reshape_11/shape"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Cast_1"
  op: "Cast"
  input: "Reshape_11"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Neg"
  op: "Neg"
  input: "Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_2"
  op: "StridedSlice"
  input: "Cast"
  input: "strided_slice_2/stack"
  input: "strided_slice_2/stack_1"
  input: "strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "Add"
  op: "Add"
  input: "Neg"
  input: "strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: ",\001\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "truncated_normal_1/mean"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "truncated_normal_1/stddev"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.009999999776482582
      }
    }
  }
}
node {
  name: "truncated_normal_1/TruncatedNormal"
  op: "TruncatedNormal"
  input: "truncated_normal_1/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "truncated_normal_1/mul"
  op: "Mul"
  input: "truncated_normal_1/TruncatedNormal"
  input: "truncated_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truncated_normal_1"
  op: "Add"
  input: "truncated_normal_1/mul"
  input: "truncated_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "weight_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 300
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "weight_1/Assign"
  op: "Assign"
  input: "weight_1"
  input: "truncated_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "weight_1/read"
  op: "Identity"
  input: "weight_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight_1"
      }
    }
  }
}
node {
  name: "bias_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "bias_1/Assign"
  op: "Assign"
  input: "bias_1"
  input: "Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "bias_1/read"
  op: "Identity"
  input: "bias_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias_1"
      }
    }
  }
}
node {
  name: "MatMul_1"
  op: "MatMul"
  input: "Reshape_7"
  input: "weight_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "add_1"
  op: "Add"
  input: "MatMul_1"
  input: "bias_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_12/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000\003\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Reshape_12"
  op: "Reshape"
  input: "add_1"
  input: "Reshape_12/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Sigmoid"
  op: "Sigmoid"
  input: "Reshape_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Reshape_13/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "Reshape_13"
  op: "Reshape"
  input: "Sigmoid"
  input: "Reshape_13/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "prediction/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "prediction"
  op: "ConcatV2"
  input: "Reshape_10"
  input: "Sigmoid"
  input: "prediction/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "output/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "output"
  op: "ConcatV2"
  input: "Add"
  input: "Reshape_13"
  input: "output/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "final_states_1/0"
  op: "Pack"
  input: "rnn/while/Exit_2"
  input: "rnn/while/Exit_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states_1/1"
  op: "Pack"
  input: "rnn/while/Exit_4"
  input: "rnn/while/Exit_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states_1/2"
  op: "Pack"
  input: "rnn/while/Exit_6"
  input: "rnn/while/Exit_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "final_states_1"
  op: "Pack"
  input: "final_states_1/0"
  input: "final_states_1/1"
  input: "final_states_1/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^rnn/multi_rnn_cell/cell_0/lstm_cell/kernel/Assign"
  input: "^rnn/multi_rnn_cell/cell_0/lstm_cell/bias/Assign"
  input: "^rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_1/lstm_cell/kernel/Assign"
  input: "^rnn/multi_rnn_cell/cell_1/lstm_cell/bias/Assign"
  input: "^rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_2/lstm_cell/kernel/Assign"
  input: "^rnn/multi_rnn_cell/cell_2/lstm_cell/bias/Assign"
  input: "^rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag/Assign"
  input: "^rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag/Assign"
  input: "^weight/Assign"
  input: "^bias/Assign"
  input: "^weight_1/Assign"
  input: "^bias_1/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 19
          }
        }
        string_val: "bias"
        string_val: "bias_1"
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
        string_val: "weight"
        string_val: "weight_1"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 19
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "bias"
  input: "bias_1"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
  input: "weight"
  input: "weight_1"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "bias"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_1/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "bias_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_1/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_1"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_1/tensor_names"
  input: "save/RestoreV2_1/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "bias_1"
  input: "save/RestoreV2_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@bias_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_2/tensor_names"
  input: "save/RestoreV2_2/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
  input: "save/RestoreV2_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_3/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_3/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_3"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_3/tensor_names"
  input: "save/RestoreV2_3/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
  input: "save/RestoreV2_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_4/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_4/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_4"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_4/tensor_names"
  input: "save/RestoreV2_4/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
  input: "save/RestoreV2_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_5/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_5/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_5"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_5/tensor_names"
  input: "save/RestoreV2_5/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
  input: "save/RestoreV2_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_6/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_6/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_6"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_6/tensor_names"
  input: "save/RestoreV2_6/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
  input: "save/RestoreV2_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_0/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_7/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_7/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_7"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_7/tensor_names"
  input: "save/RestoreV2_7/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
  input: "save/RestoreV2_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_8/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_8/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_8"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_8/tensor_names"
  input: "save/RestoreV2_8/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
  input: "save/RestoreV2_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_9/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_9/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_9"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_9/tensor_names"
  input: "save/RestoreV2_9/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
  input: "save/RestoreV2_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_10/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_10/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_10"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_10/tensor_names"
  input: "save/RestoreV2_10/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
  input: "save/RestoreV2_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_11/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_11/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_11"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_11/tensor_names"
  input: "save/RestoreV2_11/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
  input: "save/RestoreV2_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_1/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_12/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
      }
    }
  }
}
node {
  name: "save/RestoreV2_12/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_12"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_12/tensor_names"
  input: "save/RestoreV2_12/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
  input: "save/RestoreV2_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_13/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2_13/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_13"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_13/tensor_names"
  input: "save/RestoreV2_13/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
  input: "save/RestoreV2_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_14/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_14/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_14"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_14/tensor_names"
  input: "save/RestoreV2_14/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
  input: "save/RestoreV2_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_f_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_15/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_15/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_15"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_15/tensor_names"
  input: "save/RestoreV2_15/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
  input: "save/RestoreV2_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_i_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_16/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
}
node {
  name: "save/RestoreV2_16/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_16"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_16/tensor_names"
  input: "save/RestoreV2_16/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
  input: "save/RestoreV2_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@rnn/multi_rnn_cell/cell_2/lstm_cell/w_o_diag"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_17/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "weight"
      }
    }
  }
}
node {
  name: "save/RestoreV2_17/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_17"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_17/tensor_names"
  input: "save/RestoreV2_17/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "weight"
  input: "save/RestoreV2_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/RestoreV2_18/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "weight_1"
      }
    }
  }
}
node {
  name: "save/RestoreV2_18/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2_18"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2_18/tensor_names"
  input: "save/RestoreV2_18/shape_and_slices"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "weight_1"
  input: "save/RestoreV2_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@weight_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
}
versions {
  producer: 24
}
