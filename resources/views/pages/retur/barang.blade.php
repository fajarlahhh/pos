<tr>
    <td class="with-btn">
        <select class="form-control selectpicker  barang" name="retur[{{ $id }}][id]"
            onchange="satuan({{ $id }})" id="barang{{ $id }}" title="Nama Barang"
            data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            <option value="" selected>-- Pilih Barang --</option>
            @foreach ($barang as $row)
                <option value="{{ $row->id }}"
                    data-satuan="{{ $row->satuan_utama ? $row->satuan_utama->nama : '' }}"
                    {{ $data && $data['barang_id'] == $row->barang_id ? 'selected' : '' }}>{{ $row->nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control satuan" type="text" name="retur[{{ $id }}][satuan]"
            value="{{ $data ? $data['satuan'] : '' }}" autocomplete="off" required readonly />
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right currency{{ $id }} harga hitungan" id="{{ $id }}"
            type="text" name="retur[{{ $id }}][harga]" value="{{ $data ? $data['harga'] : 0 }}"
            autocomplete="off" required />
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty hitungan" type="number" step="any" name="retur[{{ $id }}][qty]"
            value="{{ $data ? $data['qty'] : 0 }}" autocomplete="off" min="1" required />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga"
            name="retur[{{ $id }}][harga_total]"
            value="{{ $data ? str_replace(',', '', $data['harga_total']) : '0.00' }}" readonly />
    </td>
    <td class="with-btn align-middle">
        <a href="javascript:;" class="btn btn-xs btn-red hapus-barang"><i class="fa fa-times fa-xs"></i></a>
    </td>
</tr>
