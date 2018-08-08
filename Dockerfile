FROM microsoft/dotnet

ENTRYPOINT ["/usr/local/bin/Microsoft.Office.WopiValidator"]

RUN git clone https://github.com/Microsoft/wopi-validator-core.git
RUN cd wopi-validator-core \
	&& dotnet build -c Release -f netcoreapp2.0 \
	&& dotnet test ./test/WopiValidator.Core.Tests/WopiValidator.Core.Tests.csproj -c Release -f netcoreapp2.0

WORKDIR /root
COPY rootfs /
