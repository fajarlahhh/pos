<div class="modal-body table-responsive">
    @if ($data)
    <table class="table">
        <tr>
            <th>Nama Barang</th>
            <th>Satuan</th>
            <th>No. Batch</th>
            <th>Harga</th>
            <th>Diskon (%)</th>
            <th>PPN (%)</th>
            <th>Qty</th>
            <th>Total</th>
        </tr>
        @foreach ($data as $index => $row)
        <tr>
            <td>{{ $row->barang->barang_nama }}</td>
            <td>{{ $row->barang->satuan_utama->satuan_nama }}</td>
            <td>{{ $row->barang_masuk_nomor_batch }}</td>
            <td class="text-right">{{ number_format($row->barang_masuk_harga_barang, 2) }}</td>
            <td class="text-right">{{ number_format($row->barang_masuk_diskon) }} %</td>
            <td class="text-right">{{ number_format($row->barang_masuk_harga_ppn) }} %</td>
            <td class="text-center">{{ number_format($row->barang_masuk_qty) }}</td>
            <td class="text-right">{{ number_format(($row->barang_masuk_harga_barang - ($row->barang_masuk_harga_barang * $row->barang_masuk_diskon/100) + ($row->barang_masuk_harga_barang * $row->barang_masuk_harga_ppn/100)) * $row->barang_masuk_qty, 2) }}</td>
        </tr>
        @endforeach
        <tr>
            <th colspan="7" class="text-center">SUB TOTAL</th>
            <th class="text-right">{{ number_format($data->first()->barang_masuk_sub_total, 2) }}</th>
        </tr>
    </table>
    @else
        Data Barang Tidak Ada
    @endif
</div>
@role('super-admin|supervisor')
<div class="modal-footer">
    <form action="/dashboard/lunasbm" method="POST">
        @csrf
        <input type="hidden" value="{{ $data->first()->barang_masuk_id }}" name="barang_masuk_id">
        <input type="submit" value="Lunas" class="btn btn-sm btn-success"  />
    </form>
</div>
@endrole
