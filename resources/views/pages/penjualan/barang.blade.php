<tr id="{{ $id }}">
    <td class="with-btn">
        <select class="form-control selectpicker barang" title="Nama Barang" id="barang{{ $id }}"
            onchange="satuan({{ $id }})" name="barang[{{ $id }}][id]" data-live-search="true"
            data-style="btn-aqua" data-size="3" data-width="100%">
            <option value="" selected>-- Pilih Barang --</option>
            @foreach ($barang as $row)
                <option value="{{ $row->id }}" data-satuan="{{ $row->satuan_semua }}"
                    {{ $data && $data['barang_id'] == $row->barang_id ? 'selected' : '' }}>
                    {{ $row->nama }}{{ $row->jenis_barang ? ' - ' . $row->jenis_barang->nama : '' }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-20">
        <select class="form-control selectpicker satuan" name="barang[{{ $id }}][nama]"
            onchange="harga({{ $id }})" id="satuan{{ $id }}" data-live-search="true"
            data-style="btn-aqua" data-size="3" data-width="100%">
        </select>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right" onchange="total_harga_barang({{ $id }})"
            onkeyup="total_harga_barang({{ $id }})" id="harga{{ $id }}"
            name="barang[{{ $id }}][harga]" value="{{ $data ? $data['harga'] : 0 }}" autocomplete="off"
            required readonly />
    </td>
    <td class="with-btn width-100">
        <input class="form-control qty" onchange="total_harga_barang({{ $id }})"
            onkeyup="total_harga_barang({{ $id }})" type="number" id="qty{{ $id }}"
            name="barang[{{ $id }}][qty]" value="{{ $data ? $data['qty'] : 0 }}" autocomplete="off"
            min="1" required />
    </td>
    <td class="with-btn width-150">
        <input class="form-control text-right currency{{ $id }} harga hitungan"
            id="diskon{{ $id }}" type="text" name="barang[{{ $id }}][diskon]"
            onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})"
            value="{{ $data ? $data['diskon'] : 0 }}" autocomplete="off" required />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga-barang"
            name="barang[{{ $id }}][total]" id="total{{ $id }}"
            value="{{ $data ? str_replace(',', '', $data['total']) : 0 }}" readonly />
    </td>
    <td class="with-btn align-middle">
        <a href="#" class="btn btn-xs btn-red "
            onclick="event.preventDefault(); hapus_barang({{ $id }})"><i class="fa fa-times fa-xs"></i></a>
    </td>
</tr>
