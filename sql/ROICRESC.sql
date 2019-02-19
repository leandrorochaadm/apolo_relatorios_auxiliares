create view roiCresc ( codproduto, roi30, roi60, crescRoi )
as
select roi60.codproduto, roi30.roi30, roi60.roi60, ((roi30.roi30 - roi60.roi60)/abs(roi60.roi60)) as crescRoi from roi30
inner join roi60 on (roi30.codproduto=roi60.codproduto)
