<div style="width: 300px" id="modal-body-cetak">
    <div class="text-center">
        <strong>{{ config('app.company') }}</strong> <br>
            <small>{{ config('app.address') }}</small><br>
            <small>Telp. {{ config('app.contact') }}</small>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-md-6 f-s-10">
            ID : {{ $data->id }}
        </div>
        <div class="col-md-6 f-s-10">
            <div class="float-right">Tgl. Nota : {{ $data->tanggal }}</div>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table">
            <tr>
                <th class="f-s-10">No.</th>
                <th class="f-s-10">Barang</th>
                <th class="f-s-10 text-right">Qty</th>
                <th class="f-s-10 text-right">Harga</th>
            </tr>
            @foreach ($data->detail as $index => $row)
                <tr>
                    <td class="f-s-10 width-10">
                        {{ $index + 1 }}
                    </td>
                    <td class="f-s-10">
                        {{ $row->barang->nama }}
                    </td>
                    <td class="text-right f-s-10 text-nowrap width-10">
                        {{ number_format($row->qty) }}
                    </td>
                    <td class="text-right f-s-10 text-nowrap">
                        {{ number_format($row->total, 2) }}
                    </td>
                </tr>
            @endforeach
            <tr>
                <th colspan="3" class="text-right f-s-10">Total :</th>
                <td class="text-right f-s-10">
                    {{ number_format($data->detail->sum('total'), 2) }}
                </td>
            </tr>
        </table>
    </div>
    
</div>