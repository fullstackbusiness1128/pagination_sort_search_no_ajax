
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <style>
        html, body {
            margin: 0;
            padding: 0;
            border: 0;
            width: 100%;
            height: 100%;
        }
        iframe {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            background: blue;
            border: 0;
            display: block;
        }
    </style>

</head>
<body>
<iframe src="{{asset('grafana.html')}}" width="100%" height="100%" style="display:block; margin: 0"></iframe>
</body>
</html>