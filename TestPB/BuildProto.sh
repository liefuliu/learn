mkdir ./ProtoGen
protoc --plugin=/usr/local/bin/protoc-gen-objc proto/class.proto --objc_out="./ProtoGen"