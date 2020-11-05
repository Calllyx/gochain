FROM golang
EXPOSE 8000
COPY app.go .
COPY blockchain.html /
COPY openapi.yml .
RUN go get -d -v github.com/lib/pq github.com/julienschmidt/httprouter
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o a.out
RUN ls /
CMD ["./a.out"]
