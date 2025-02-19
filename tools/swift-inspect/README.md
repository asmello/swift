# swift-inspect

swift-inspect is a debugging tool which allows you to inspect a live Swift process to gain insight into the runtime interactions of the application.

swift-inspect uses the reflection APIs to introspect the live process.  It relies on the swift remote mirror library to remotely reconstruct data types.

### Building

swift-inspect can be built using [swift-package-manager](https://github.com/apple/swift-package-manager).

##### Windows

In order to build on Windows, some additional parameters must be passed to the build tool to locate the necessary libraries.

~~~
swift build -Xcc -I%DEVELOPER_DIR%\Toolchains\unknown-Asserts-development.xctoolchain\usr\include\swift\SwiftRemoteMirror -Xlinker %DEVELOPER_DIR%\Toolchains\unknown-Asserts-development.xctoolchain\usr\lib\swift\windows\x86_64\swiftRemoteMirror.lib
~~~

### Using

The following inspection operations are available currently.

##### All Platforms

dump-cache-nodes &lt;name-or-pid&gt;
: Print the metadata cache nodes.

dump-conformance-cache &lt;name-or-pid&gt;
: Print the content of the protocol conformance cache.

dump-generic-metadata &lt;name-or-pid&gt; [--backtrace] [--backtrace-long]
: Print generic metadata allocations.

dump-raw-metadata &lt;name-or-pid&gt; [--backtrace] [--backtrace-long]
: Print metadata allocations.

##### Darwin Only

dump-arrays &lt;name-or-pid&gt;
: Print information about array objects in the target

dump-concurrency &lt;name-or-pid&gt;
: Print information about tasks, actors, and threads under Concurrency.