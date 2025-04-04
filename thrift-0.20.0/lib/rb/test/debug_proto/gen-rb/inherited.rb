#
# Autogenerated by Thrift Compiler (0.20.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'srv'
require 'debug_proto_test_types'

module Thrift
  module Test
    module Inherited
      class Client < ::Thrift::Test::Srv::Client 
        include ::Thrift::Client

        def identity(arg)
          send_identity(arg)
          return recv_identity()
        end

        def send_identity(arg)
          send_message('identity', Identity_args, :arg => arg)
        end

        def recv_identity()
          fname, mtype, rseqid = receive_message_begin()
          handle_exception(mtype)
          if reply_seqid(rseqid)==false
            raise "seqid reply faild"
          end
          result = receive_message(Identity_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'identity failed: unknown result')
        end

      end

      class Processor < ::Thrift::Test::Srv::Processor 
        include ::Thrift::Processor

        def process_identity(seqid, iprot, oprot)
          args = read_args(iprot, Identity_args)
          result = Identity_result.new()
          result.success = @handler.identity(args.arg)
          write_result(result, oprot, 'identity', seqid)
        end

      end

      # HELPER FUNCTIONS AND STRUCTURES

      class Identity_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        ARG = 1

        FIELDS = {
          ARG => {:type => ::Thrift::Types::I32, :name => 'arg'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class Identity_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

    end

  end
end
