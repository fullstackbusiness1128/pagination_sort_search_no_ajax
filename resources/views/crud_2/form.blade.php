@extends('layouts.default')
@section('css')
    <style>
        .form-group.required label:after {
            content: " *";
            color: red;
            font-weight: bold;
        }
    </style>
@endsection
@section('content')
    <div class="container">
        <div class="col-md-8 offset-md-2">
            <h1>New Customer</h1>
            <hr/>

            <form method="post" action="{{url('laravel-crud-search-sort/create')}}">
            {{csrf_field()}}
                    <div class="form-group row required">
                <label for="name" class="col-form-label col-md-3 col-lg-2">Name</label>
                <div class="col-md-8">
                    <input class="form-control" autofocus="" placeholder="Name" name="name" type="text" id="name">
                    {!! $errors->first('name','<span class="invalid-feedback">:message</span>') !!}
                </div>
            </div>
            <div class="form-group row">
                <label for="gender" class="col-form-label col-md-3 col-lg-2">Gender</label>
                <div class="col-md-8">
                    <select class="form-control" id="gender" name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div class="form-group row required">
                <label for="email" class="col-form-label col-md-3 col-lg-2">Email</label>
                <div class="col-md-8">
                    <input class="form-control" placeholder="Email" name="email" type="text" id="email">
                    {!! $errors->first('email','<span class="invalid-feedback">:message</span>') !!}
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-3 col-lg-2"></div>
                <div class="col-md-4">
                    <a href="{{url('laravel-crud-search-sort')}}" class="btn btn-danger">
                        Back</a>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </div>
        </form>
        </div>
    </div>
@endsection