<?php

namespace App\Http\Livewire;

use App\Models\Barang;
use Livewire\Component;

class BarangMasuk extends Component
{
    public $barang = [];
    public $barang_masuk = [];
    public $input = '';
    public $nomor = 0;

    public function mount()
    {
        $this->nomor;
        $this->barang = Barang::all();
        $this->barang_masuk = [
        ];
    }

    public function tambahBarang()
    {
        $this->barang_masuk[] =
        [
            'barang_id' => '',
            'qty' => 1,
            'harga_barang' => 0,
            'nomor_batch' => '',
            'kadaluarsa' => date('d F Y'),
        ];
        $this->emit('reinitialize', $this->nomor++);
    }

    public function hapusBarang($i)
    {
        unset($this->barang_masuk[$i]);
        array_values($this->barang_masuk);
    }

    public function render()
    {
        info($this->barang_masuk);
        return view('livewire.barang-masuk');
    }
}
