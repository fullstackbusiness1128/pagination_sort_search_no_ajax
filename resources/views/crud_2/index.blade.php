@extends('layouts.default')
@section('css')
    <style>
        a, a:hover {
            color: white;
        }
    </style>
@endsection
@section('content')
    <div class="container">
        <div class="float-right">
            <a href="{{url('laravel-crud-search-sort/create')}}" class="btn btn-primary">New</a>
        </div>
        <h1 style="font-size: 2.2rem">Customers List (Laravel CRUD, Search, Sort Example)</h1>
        <hr/>

        <form method="get" action="{{url('laravel-crud-search-sort')}}">

        <div class="row">
            <div class="col-sm-4 form-group">

                <select class="form-control" onchange="form.submit()" name="gender">
                    <option value="-1">Select Gender</option>
                    <option value="Male" selected="selected">Male</option>
                    <option value="Female">Female</option>
                </select>

            </div>
            <div class="col-sm-5 form-group">
                <div class="input-group">
                    <input class="form-control" id="search"
                           value="{{ request('search') }}"
                           placeholder="Search name" name="search"
                           type="text" id="search"/>
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-warning"
                        >
                            Search
                        </button>
                    </div>
                </div>
            </div>
            <input type="hidden" value="{{request('field')}}" name="field"/>
            <input type="hidden" value="{{request('sort')}}" name="sort"/>
        </div>
        </form>
        
        <table class="table table-bordered bg-light">
            <thead class="bg-dark" style="color: white">
            <tr>
                <th width="60px" style="vertical-align: middle;text-align: center">No</th>
                <th style="vertical-align: middle">
                    <a href="{{url('laravel-crud-search-sort')}}?search={{request('search')}}&gender={{request('gender')}}&field=name&sort={{request('sort','asc')=='asc'?'desc':'asc'}}">
                        Name
                    </a>
                    {{request('field','name')=='name'?(request('sort','asc')=='asc'?'&#9652;':'&#9662;'):''}}
                </th>
                <th style="vertical-align: middle">
                    <a href="{{url('laravel-crud-search-sort')}}?search={{request('search')}}&gender={{request('gender')}}&field=gender&sort={{request('sort','asc')=='asc'?'desc':'asc'}}">
                        Gender
                    </a>
                    {{request('field')=='gender'?(request('sort','asc')=='asc'?'&#9652;':'&#9662;'):''}}
                </th>
                <th style="vertical-align: middle">
                    <a href="{{url('laravel-crud-search-sort')}}?search={{request('search')}}&gender={{request('gender')}}&field=email&sort={{request('sort','asc')=='asc'?'desc':'asc'}}">
                        Email
                    </a>
                    {{request('field')=='email'?(request('sort','asc')=='asc'?'&#9652;':'&#9662;'):''}}
                </th>
                <th width="130px" style="vertical-align: middle">Action</th>
            </tr>
            </thead>
            <tbody>
            @php
                $i=1;
            @endphp
            @foreach($customers as $customer)
                <tr>
                    <th style="vertical-align: middle;text-align: center">{{$i++}}</th>
                    <td style="vertical-align: middle">{{ $customer->name }}</td>
                    <td style="vertical-align: middle">{{ $customer->gender }}</td>
                    <td style="vertical-align: middle">{{$customer->email}}</td>
                    <td style="vertical-align: middle" align="center">
                        <form id="frm_{{$customer->id}}"
                              action="{{url('laravel-crud-search-sort/delete/'.$customer->id)}}"
                              method="post" style="padding-bottom: 0px;margin-bottom: 0px">
                            <a class="btn btn-primary btn-sm" title="Edit"
                               href="{{url('laravel-crud-search-sort/update/'.$customer->id)}}">
                                Edit</a>
                            <input type="hidden" name="_method" value="delete"/>
                            {{csrf_field()}}
                            <a class="btn btn-danger btn-sm" title="Delete"
                               href="javascript:if(confirm('Are you sure want to delete?')) $('#frm_{{$customer->id}}').submit()">
                                Delete
                            </a>
                        </form>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <nav>
            <ul class="pagination justify-content-end">
                {{$customers->links('vendor.pagination.bootstrap-4')}}
            </ul>
        </nav>
    </div>
@endsection