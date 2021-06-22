<?php 
	include('../koneksi/koneksi.php');
	if((isset($_GET['aksi']))&&(isset($_GET['data']))){
		if($_GET['aksi']=='hapus'){
			$kode_hobi = $_GET['data'];
			//hapus hobi
			$sql_dh = "delete from `hobi` 
			where `kode_hobi` = '$kode_hobi'";
			mysqli_query($koneksi,$sql_dh);
		}
	}
?>

<?php include("includes/head.php") ?>
<?php include("includes/header.php") ?>
<?php include("includes/sidebar.php") ?>
<?php include('../koneksi/koneksi.php');?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3><i class="fas fa-database"></i> Hobi</h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Hobi</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title" style="margin-top:5px;"><i class="fas fa-list-ul"></i> Daftar Hobi</h3>
                <div class="card-tools">
                  <a href="tambah_hobi.php" class="btn btn-sm btn-info float-right"><i class="fas fa-plus"></i> Tambah Hobi</a>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
				<div class="col-sm-12">
					<?php if(!empty($_GET['notif'])){?>
						<?php if($_GET['notif']=="tambahberhasil"){?>
							<div class="alert alert-success" role="alert">
								Data Berhasil Ditambahkan
							</div>
						<?php } else if($_GET['notif']=="editberhasil"){?>
							<div class="alert alert-success" role="alert">
								Data Berhasil Diubah
							</div>
						<?php }?>
					<?php }?>
				</div>
				<div class="col-md-12">
					<form method="get" action="hobi.php">
						<div class="row">
							<div class="col-md-4 bottom-10">
								<input type="text" class="form-control" id="kata_kunci" name="katakunci">
							</div>
							<div class="col-md-5 bottom-10">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-search"></i>  
									Search
								</button>
							</div>
						</div><!-- .row -->
					</form>
				</div>
				<br> 
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th width="5%">No</th>
                      <th width="80%">Hobi</th>
                      <th width="15%"><center>Aksi</center></th>
                    </tr>
					<?php
					//menampilkan data hobi
						$sql_h = "SELECT `kode_hobi`, `hobi` FROM `hobi`";
							if (isset($_GET["katakunci"])){
								  $katakunci_hobi = $_GET["katakunci"];
								  $sql_h .= " where `hobi` LIKE '%$katakunci_hobi%'";
							} 
						$sql_h .= " order by `hobi` ";
						$query_h = mysqli_query($koneksi,$sql_h);
						$no=1;
						while($data_h = mysqli_fetch_row($query_h)){
						$kode_hobi = $data_h[0];
						$hobi = $data_h[1];
					?>	
					<tr>
						<td><?php echo $no;?></td>
						<td><?php echo $hobi;?></td>
						<td>
						<a href="edit_hobi.php?data=<?php echo $kode_hobi;?>" 
							class="btn btn-xs btn-info">
							<i class="fas fa-edit"></i> Edit</a>
							<a href="javascript:if(confirm('Anda yakin ingin menghapus data <?php echo $hobi; ?>?'))
							window.location.href = 'hobi.php?aksi=hapus&data=<?php echo $kode_hobi;?>'" 
							class="btn btn-xs btn-warning"><i class="fas fa-trash"></i> Hapus 
						</a> 
						</td>
					</tr>
					<?php $no++;}?>
                  </thead>
                  
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php include("includes/footer.php") ?>

</div>
<!-- ./wrapper -->

<?php include("includes/script.php") ?>
</body>
</html>
