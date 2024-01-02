<div class="modal-body table-responsive">
    @if ($data)
        <table class="table">
            <tr>
                <th>Barang</th>
                <th>Satuan</th>
                <th>Harga</th>
                <th>Qty</th>
                <th>Diskon</th>
                <th>Total</th>
            </tr>
            @foreach ($data as $index => $row)
                <tr>
                    <td class=" text-nowrap">{{ $row->barang->nama }}</td>
                    <td class=" text-nowrap">{{ $row->satuan_utama ? $row->satuan_utama->nama : '' }}</td>
                    <td class="text-right  text-nowrap">{{ number_format($row->harga, 2) }}</td>
                    <td class="text-right ">{{ number_format($row->qty) }}</td>
                    <td class="text-right ">{{ number_format($row->diskon) }} %</td>
                    <td class="text-right">{{ number_format($row->total, 2) }}</td>
                </tr>
            @endforeach
            <tr>
                <th colspan="5" class="text-center">SUB TOTAL</th>
                <th class="text-right">{{ number_format($data->sum('total'), 2) }}</th>
            </tr>
        </table>
    @else
        Data Barang Tidak Ada
    @endif
</div>
@role('super-admin|supervisor')
    <div class="modal-footer">
        <form action="/dashboard/lunasjual" method="POST">
            @csrf
            <input type="hidden" value="{{ $data->first()->penjualan_id }}" name="id">
            <input type="submit" value="Lunas" class="btn btn-sm btn-success" />
        </form>
    </div>
@endrole
