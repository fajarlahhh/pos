<tr id="{{ $id }}">
    <td class="with-btn width-200">
        <input class="form-control" type="text" name="satuan[{{ $id }}][nama]" value="{{ $data? $data['nama']: '' }}" autocomplete="off" />
    </td>
    <td class="with-btn width-200">
        <input class="form-control text-right currency" id="harga{{ $id }}" type="text" name="satuan[{{ $id }}][harga]" value="{{ $data? $data['harga']: 0 }}" autocomplete="off" required/>
    </td>
    <td class="with-btn width-200">
        <input class="form-control" type="number" name="satuan[{{ $id }}][rasio_dari_utama]" value="{{ $data? $data['rasio_dari_utama']: 0 }}" autocomplete="off" min="1" required/>
    </td>
    <td class="with-btn align-middle">
        <a href="#" class="btn btn-xs btn-red " onclick="event.preventDefault(); hapus_satuan({{ $id }})"><i class="fa fa-times fa-xs"></i></a>
    </td>
</tr>
