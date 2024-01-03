<div style="width: 280px;" id="modal-body-cetak">
    <style>
        .consolas {
            font-family: 'Consolas', monospace;
        }

        table #kwitansi {
            vertical-align: top;
        }
    </style>

    <div class="consolas">
        <div style="text-align: center!important">
            <strong style="font-size: 15px">{{ config('app.company') }}</strong> <br>
            <small><small>{{ config('app.address') }}</small></small><br>
            <small><small>Telp. {{ config('app.contact') }}</small></small>
        </div>
        <br>
        <br>
        <div style="width: 50; float:left; font-size:10px">
            {{ $data->id }}
        </div>
        <div style="width: 50%; float:right; text-align: right; font-size:10px  ">
            {{ $data->tanggal }}
        </div>
        <br>
        <br>
        <table id="kwitansi" style="border-collapse: collapse; width: 100%; font-size: 10px">
            <tr>
                <th style="text-align: left">No.</th>
                <th style="text-align: left">Barang</th>
                <th style="text-align: right">Qty</th>
                <th style="text-align: right">Harga</th>
            </tr>
            @foreach ($data->detail as $index => $row)
                <tr>
                    <td style="width: 5px; text-align: left">
                        {{ $index + 1 }}
                    </td>
                    <td style="text-align: left">
                        {{ $row->barang->nama }}
                    </td>
                    <td style="text-align: right; width:5px;">
                        {{ number_format($row->qty) }}
                    </td>
                    <td style="text-align: right; width:70px; white-space: nowrap;">
                        {{ number_format($row->total) }}
                    </td>
                </tr>
            @endforeach
            <tr>
                <th style="text-align: left;" colspan="3">Total</th>
                <td style="text-align: right; white-space: nowrap;">
                    {{ number_format($data->detail->sum('total')) }}
                </td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <div style="text-align: center!important">
            <strong style="font-size: 18px">TERIMA KASIH</strong>
        </div>
    </div>
</div>
