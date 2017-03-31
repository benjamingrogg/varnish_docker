vcl 4.0;
backend default {
    .host = "myhost";
    .port = "80";
}

# what files to cache
sub vcl_recv {
    if (req.url ~ "\.(png|gif|jpg|ico|txt|swf|css|js)$") {
        return(hash);
    }
}

# strip the cookie before the image is inserted into cache
sub vcl_backend_response {
    if (bereq.url ~ "\.(png|gif|jpg|swf|css|js)$") {
        unset beresp.http.set-cookie;
    }
}

# add response header to see if document was cached
sub vcl_deliver {
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
    } else {
        set resp.http.X-Cache = "MISS";
    }
}

