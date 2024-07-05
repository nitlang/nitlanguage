# Dockerfile for nitlang/nitiwiki used to build the nitlanguage.org website
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y build-essential ccache libgc-dev libunwind-dev pkg-config git libevent-dev
RUN git clone https://github.com/nitlang/nit.git
RUN cd nit && git checkout 27988ad6dff14048f5321f8d81a76ebbdc7fb31b
RUN make -C nit
ENV PATH /nit/bin/:$PATH
RUN make -C nit/contrib/nitiwiki

FROM ubuntu:24.04
RUN apt-get update && apt-get install -y git ca-certificates libunwind8 libgc1 highlight pandoc wget unzip make texlive-latex-base lmodern texlive-latex-recommended texlive-latex-extra --no-install-recommends && apt-get clean
COPY --from=0 /nit/contrib/nitiwiki/bin/nitiwiki /bin/nitiwiki
COPY --from=0 /nit/misc/highlight/nit.lang /usr/share/highlight/langDefs
RUN /bin/nitiwiki --help
