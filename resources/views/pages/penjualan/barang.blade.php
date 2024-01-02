<tr id="{{ $id }}">
    <td class="with-btn">
        <select class="form-control selectpicker barang" title="Nama Barang" id="barang{{ $id }}"
            onchange="set_satuan_harga({{ $id }})" name="barang[{{ $id }}][id]" data-live-search="true"
            data-style="btn-aqua" data-size="3" data-width="100%">
            <option value="" selected>-- Pilih Barang --</option>
            @foreach ($barang as $row)
                <option value="{{ $row->id }}" data-satuan="{{ $row->satuan }}" data-harga="{{ $row->harga }}">{{ $row->nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-100">
        <input type="text" class="form-control" name="barang[{{ $id }}][satuan]" value=""  id="satuan{{ $id }}"
            autocomplete="off" required readonly />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right" id="harga{{ $id }}"
            name="barang[{{ $id }}][harga]" value="0.00" autocomplete="off" required readonly />
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty" onchange="total_harga_barang({{ $id }})"
            onkeyup="total_harga_barang({{ $id }})" type="number" id="qty{{ $id }}"
            name="barang[{{ $id }}][qty]" value="" autocomplete="off" min="1" required />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga-barang"
            name="barang[{{ $id }}][total]" id="total{{ $id }}" value="0.00" readonly />
    </td>
    <td class="with-btn align-middle">
        <a href="#" class="btn btn-xs btn-red "
            onclick="event.preventDefault(); hapus_barang({{ $id }})"><i class="fa fa-times"></i></a>
    </td>
</tr>
