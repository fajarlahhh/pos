<tr>
    <td class="with-btn">
        <select class="form-control selectpicker barang" name="barang[{{ $id }}][id]"
            onchange="satuan({{ $id }})" id="barang{{ $id }}" title="Nama Barang"
            data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%" required>
            <option value="" selected>-- Pilih Barang --</option>
            @foreach ($data_barang as $row)
                <option value="{{ $row->id }}" data-satuan="{{ $row->satuan }}">{{ $row->nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input class="form-control satuan" type="text" name="barang[{{ $id }}][satuan]"
            value="" autocomplete="off" required readonly />
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right currency{{ $id }} harga hitungan" id="{{ $id }}"
            type="text" name="barang[{{ $id }}][harga]"
            value="" autocomplete="off" required />
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty hitungan" type="number" step="any"
            name="barang[{{ $id }}][qty]" value="" autocomplete="off"
            min="1" required />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga"
            name="barang[{{ $id }}][harga_total]"
            value="0.00" readonly />
    </td>
    <td class="with-btn align-middle width-10">
        <a href="javascript:;" class="btn btn-xs btn-red hapus-barang"><i class="fa fa-times"></i></a>
    </td>
</tr>
