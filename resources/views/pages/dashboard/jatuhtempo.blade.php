<div class="modal-body table-responsive">
    @if ($data)
        <table class="table">
            <tr>
                <th>Nama Barang</th>
                <th>Satuan</th>
                <th>Harga</th>
                <th>Diskon (%)</th>
                <th>PPN (%)</th>
                <th>Qty</th>
                <th>Total</th>
            </tr>
            @foreach ($data as $index => $row)
                <tr>
                    <td>{{ $row->barang->nama }}</td>
                    <td class=" text-nowrap">{{ $row->satuan_utama ? $row->satuan_utama->nama : '' }}</td>
                    <td class="text-right">{{ number_format($row->harga, 2) }}</td>
                    <td class="text-right">{{ number_format($row->diskon) }} %</td>
                    <td class="text-right">{{ number_format($row->ppn) }} %</td>
                    <td class="text-center">{{ number_format($row->qty) }}</td>
                    <td class="text-right">
                        {{ number_format($row->sub_total, 2) }}
                    </td>
                </tr>
            @endforeach
            <tr>
                <th colspan="6" class="text-center">SUB TOTAL</th>
                <th class="text-right">{{ number_format($data->sum('sub_total'), 2) }}</th>
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
            <input type="hidden" value="{{ $data->first()->barang_masuk_id }}" name="id">
            <input type="submit" value="Lunas" class="btn btn-sm btn-success" />
        </form>
    </div>
@endrole
