<tr id="{{ $id }}">
    <td class="with-btn" >
        <select class="form-control selectpicker barang-id" title="Nama Barang" id="barang{{ $id }}" onchange="satuan({{ $id }})" name="barang[{{ $id }}][barang_id]" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
            @foreach($barang as $row)
            <option value="{{ $row->barang_id }}" data-satuan="{{ $row->satuan_semua }}" {{ $data && $data['barang_id'] == $row->barang_id? 'selected': '' }}>{{ $row->nama }}</option>
            @endforeach
        </select>
    </td>
    <td class="with-btn width-20" >
        <select class="form-control selectpicker" name="barang[{{ $id }}][nama]" onchange="harga({{ $id }})" id="satuan{{ $id }}" data-live-search="true" data-style="btn-aqua" data-size="3" data-width="100%">
        </select>
        <input type="hidden" name="barang[{{ $id }}][rasio_dari_utama]" value="{{ $data? $data['rasio_dari_utama']: 0 }}" id="rasio{{ $id }}" value="0" required/>
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right" onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})" id="harga{{ $id }}" name="barang[{{ $id }}][harga]" value="{{ $data? $data['harga']: 0 }}" autocomplete="off" required readonly/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})" type="number" id="qty{{ $id }}" name="barang[{{ $id }}][qty]" value="{{ $data? $data['qty']: 0 }}" autocomplete="off" min="1" required/>
    </td>
    <td class="with-btn width-100">
        <input class="form-control" onchange="total_harga_barang({{ $id }})" onkeyup="total_harga_barang({{ $id }})" type="number" id="diskon{{ $id }}" name="barang[{{ $id }}][diskon]" max="100" value="{{ $data? $data['diskon']: 0 }}" autocomplete="off" min="0" />
    </td>
    <td class="with-btn width-150">
        <input type="text" class="form-control text-right total-harga-barang" name="barang[{{ $id }}][total]" id="total{{ $id }}" value="{{ $data? str_replace(',', '', $data['total']): 0 }}" readonly/>
    </td>
    <td class="with-btn align-middle">
        <button class="btn btn-xs btn-red " onclick="hapus_barang({{ $id }})"><i class="fa fa-times fa-xs"></i></button>
    </td>
</tr>
