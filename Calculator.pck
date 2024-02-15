GDPC                 0                                                                      1   P   res://.godot/exported/133200997/export-1c89a0432646758217dc884e209d3648-add.scn �
      �      �w��<���Z��
�N�    T   res://.godot/exported/133200997/export-21eceac58a1f94cd98f0bda286fe54dc-times.scn   ��      �      �͡���.��RU�2��    P   res://.godot/exported/133200997/export-2b8b471b708485a66f3d486946c5d76b-sub.scn @�      �      ts�:�r�Te���E�    P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn@�      NG      c�����DI.B    T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  ��      �      ��MQ_-	��R    P   res://.godot/exported/133200997/export-5cb0866679a2eab282af4d4a9e66c5c1-min.scn ��      �      �܎}��亿LA�e�o�    T   res://.godot/exported/133200997/export-6df5da4c24ca1f5d10af08562b210af6-divide.scn  �{      �      �I�x�
�mC�����    T   res://.godot/exported/133200997/export-84253810b8f99f1280c59e6b36e176d6-equals.scn  @�      �      _�y��;P�z՟�r���    T   res://.godot/exported/133200997/export-9862176e57e698d497b972795114153d-number.scn  ��      �      �%��F���Sy<v�y    P   res://.godot/exported/133200997/export-a14e416984f3994a7131603b2d16717d-c.scn   �      �      ���?�a,���a7�a�    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    P   res://.godot/imported/1705723842549.png-592e2937161982dbc3947b81969a48af.ctex   �            D1�¢XY��1��}y�    \   res://.godot/imported/Calculator.apple-touch-icon.png-656dce9a9d532a6692251afbb44eef2b.ctex �      p      韌��WbC1��    P   res://.godot/imported/Calculator.icon.png-1280cfb8e468aa89eaa1a00c7099b8bc.ctex `7      ^      2��r3��MgB�[79    L   res://.godot/imported/Calculator.png-7193292291731408716d3181ee51908d.ctex  �G      -      �%�$����<�׿�+    D   res://.godot/imported/dirt.png-81db9f47be16674f640109976e043256.ctex�w      t       ��m���N��5�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex0�      ^      2��r3��MgB�[79    H   res://.godot/imported/stone.png-083619ed9cb60da6213c6ca04d200509.ctex   �      �       �'f�7�͒<Y�T�*�>       res://.godot/uid_cache.bin        �      1������'���x�s�        res://1705723842549.png.import              ���;��>��o�b       res://Area2D.gd �      �       lGy���}����r�       res://C.gd  p      p       �шWY�{�Wo��2�K    ,   res://Calculator.apple-touch-icon.png.import04      .      bXO���1i{��`��        res://Calculator.icon.png.import�D      
      �8�2�H�,j
��       res://Calculator.png.import �t      �      ����#�$v�X(%~<       res://Global/calculator.gd          �      5 &A�R(j�0\����       res://add.gd 
      q       ���R
0��je;ʁ��       res://add.tscn.remap�     `       ��@Y��^�$���n�       res://c.tscn.remap  �     ^       C ��uTL6�ӄ�       res://dirt.png.import   px      �      Y��O�Z���04�O�       res://divide.gd `{      w       �TA���I�4�?����]       res://divide.tscn.remap P     c       �xƂ��j�T��PE{�       res://equals.gd Ѐ      n       �X|KJ�|��)��|�       res://equals.tscn.remap �     c        ��I��l���b�?Z       res://icon.svg  �     N      ]��s�9^w/�����       res://icon.svg.import   ��      K      �R[ᜥ�1@� ���       res://main.gd   ��      R      k��4.���dRв1�$       res://main.tscn.remap   0     a       �J�Sw� ������       res://min.tscn.remap�     `       ��Q4�4�W����j��       res://number.gd 0�      �       ]t)l  ح��}�U>�       res://number.tscn.remap       c       �Ii�.`�?nձ���       res://player.gd ��      �      ��iZ��R-�4��=���       res://player.tscn.remap p     c       ������T�?�L���       res://project.binary�     �	      �
�N>��GG���       res://stone.png.import  ��      �      JA�~��rp�q�)a�       res://sub.gd��      q       ��܊i�vz��7�=�       res://sub.tscn.remap�     `       �ꂞ�-���G��it       res://times.gd   �      t       ���F�k(:Hg�?���       res://times.tscn.remap  @     b       �����>����`q��    ������MU�list=Array[Dictionary]([])
�E9ԡextends Node


func is_operator(c):
	return c in ["+", "-", "*", "/"]

func get_precedence(op):
	return {
		"+": 1,
		"-": 1,
		"*": 2,
		"/": 2
	}[op]

func infix_to_postfix(expression):
	var output_queue = []
	var operator_stack = []
	var tokens = expression.split(" ", false)
	for token in tokens:
		if token.is_valid_int() or token.is_valid_float():
			output_queue.append(token)
		elif is_operator(token):
			while operator_stack and get_precedence(operator_stack[-1]) >= get_precedence(token):
				output_queue.append(operator_stack.pop_back())
			operator_stack.append(token)
		# Tambahkan dukungan untuk tanda kurung di sini jika diperlukan
	
	while operator_stack:
		output_queue.append(operator_stack.pop_back())
	
	return output_queue

# Fungsi untuk mengevaluasi ekspresi postfix
func evaluate_postfix(expression):
	var stack = []
	for token in expression:
		if token.is_valid_int() or token.is_valid_float():
			stack.append(float(token))
		elif is_operator(token):
			if stack.size() < 2:
				print("Error: insufficient values in the expression for the operation ", token)
				return 0
			var right = stack.pop_back()
			var left = stack.pop_back()
			match token:
				"+": stack.append(left + right)
				"-": stack.append(left - right)
				"*": stack.append(left * right)
				"/": stack.append(left / right)
	if stack.size() != 1:
		print("Error: The final stack size is not 1. There might be too many numbers or too few operations.")
		return 0
	return stack[0]

�U��8GST2             ����                         �   RIFF�   WEBPVP8L�   /�O��$��?Y|���PԶ����N�aB85��@���E�JP������  ���a)�qo�\ ��Z{�湏��E`� �1�@zt��Z�*���+r۶avo�i$� ���C3}�p��D"���e�\VO�]>��(F���)F~�.���?�pQ%��\����p����ÿ$ϻ-���%����� �;��ky-Z�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://duj5usophe7hr"
path="res://.godot/imported/1705723842549.png-592e2937161982dbc3947b81969a48af.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://1705723842549.png"
dest_files=["res://.godot/imported/1705723842549.png-592e2937161982dbc3947b81969a48af.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
@��y�`�����extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").add_text(" + ")
{��^p��+>u�A��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://add.gd ��������      local://RectangleShape2D_wb1vq O         local://PackedScene_fldp5 �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         add    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                +             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC0u�extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
xextends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").clear_text()
RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://C.gd ��������      local://RectangleShape2D_wb1vq M         local://PackedScene_sqko3 ~         RectangleShape2D       
     @B  @B         PackedScene          	         names "         C    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                AC             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC�=<U? GST2   �   �      ����               � �        8  RIFF0  WEBPVP8L#  /��,� j�Fjv?�G|$"���X���׾���m��q��7��HrT�?����
�=��$���nv7υ���c 쁙L�n ���'�g,/ Rq�m��s�!"&�-�{�С�=�伿$[��&8S%u63��2��d��i�������)w�0���\ɵ�oI�,I�lټ����{�%L��I�$�Q=�sb���'z��)m�v<�ΏI&*;�J׸mwalke{˽���m�3m��	�m����������mc��Gɖ�I�h��a8�|����ý��{`fޝ�L�)��(�O����F��3�ڶ-{����ׯ_f����<Kݗ�S�Yf�27K���I�T۶mK-�ff���Ln)r��p����m#Iܽ�[�oL i��w�	$m|�Ο¶m��nw�
�6`�y� p�� �� ��]��x��3ӛ�K��(��n��Ib�!�1$��l5Yc������?�~�68�y ��u \��@��=�ȥ��� P����Ξ��T:�Pt
���@2
O�U���u�o������M0J �+D�C/��������
w�^�ʾf�ˮE�L��B"�AuPuZ��m�e����q������nV�IP��w��?_"ӟ#��gH.�5m�}�԰2LMj2%��:�Y���>|�������5!��[�>���2{o�K%����uշ��Vg*�C�+ 	�0C�������WB/D)˷ H����|�}���97�"(A 5  ��a��  2��[�e  &��Nu�ͮ��y\�����|/ɳ��`d�='�]�C��.���0� ��ĭ�[UQV���ѭ�?/w��C��LO���,=W�k]5z�R�Dlx�l9!!BT� N�b�.S=Lޥn� Q��w<�~�/�v��_/�����w���L�p�wW�z�Q��jDyQZN�� D��H�V��lT���FĝA6��Ŝ����_���z�� ;|w���򮓿��:��\#���|@�dDѨ[��/�!ӭ��-���:�� ������w��L?
#�F}� c�.�	��|�3�~����T ��]{m	�V*��v}��|!�Q�R��Y��o���[��!��z^�q�ky�-g@�d�o�  �4�l��c`}	֗�A'�Ʊ�(-�ٓo�� ���ۧ�����՛��7=k��  �rdPNxK  �|w���d��N_��K!b�l�B�=W�#"��r[Y�S�YB�(V+�0"�#�� ��vd�~,��Ū��(
CdQn� �2ر$�p��(.yD�Z6"hAuX�&Y�:��
%��PKh�� �G�����$	1@&e�$P�%a�n�"1�BܻٹDл<B�� G��`+5j,�s�s���fJR��,�J3�<X���Z�ZPhC�5&�/�	*�|���|<|�H\5g%&�R�ƴ4@\!!aEv�D���X	�Q���<Y0Mc�k?)�՜��ilbF��^��t-����d���kD���Ԣ� ؤBk��Oy֘\L�9��,�y��U�T���B���:�TKA�HU��c�b�*O���u�>��*P+jߦIcV�<c�g��vg}��%���;�5p1�2m�cݭ��h�RL�v�5�
$�F���1��V���+�&��V؝]�VБ�\����^��W���_"�Q�K�69;]ݯ���ժ%ji�r����K�{�l�j�;���V:��-ӹ��`���˽v&�[���H��VЁ�H�Q�����,`c0eͦԖ�!�Z��R��6��1�������g`0��`my�� �
FE-l����
K:.���J��0MAa�1d��*h�u*��dJ�Q��JFY2�*�l�ʴ`Pq
T��a�b���%.�E$i��5(K5mN7X�T�j��l\6��Mڴ&�c-K^�Z��g]��$�Tf�Q���U��QB��N�*,�.�A�k���VE �?CI�-��.QrѕmU��k��:Z׳y��;�R� ��s�ƴ;u%�\Mv��������h�le/`�����X�_�v�Q����X��$!9��ќ��6��g���6���v�F�2�sw�2?�6� )���
m?'��Bl �Դ����GH���ƌ5aԦe��.����Ya$@X�S=B�X��jq��0mӯ}=�
g�@ӭ�V<�@~B)�W���ٵ������c�V[`�82��U��Q�ԅ{�Z��q��wˣ1( �*.>O�%m�^�}o��T�d�9w�5���Җ����ѱa��/9��V�\�M�QE0�G�ڸ\�#�h�39�����Y �2^�X�-�8$	���F�d�ҝ->A��q��UY�T�-��D4$q�v޲9eB��5�o������er��]A:P`F�ƙ�U��� *28�*���C�f�A���H����QrT��Ӣ� ��	����f���J���f�o�����nT�\����fP�\�+WC;m=L.��u�i_�n���,�;���WL���O�h2`j�n/�f���F��t�Y$��֫(�\�QЕ��rP��l�݃��:�ul�(M;��A�9��v��1;����|Z{mR������dy���>�]B;��U��[�^��o�	+ӗ0���o�(�Q=^�m�d켢��7���8������v�b���w��wq|�5���^|.�]x���H��pޙ��sKw�l�ʥ�#��׼Wp$7z.�kt���[x@�A].5�������<��c��n�w����������.̜��m���m<��䪗����RNv���n?��~�뮽��U��~Z�I[�կ*�Cl�E����Ytgx�ǟv�#�x��^��ȕgu�Լ�"��,?n�EϽٵW:���.]->l�����<�;`+0����u�?m뷯��B�/�<��_i��y��3u��X��_x��k�TO�v��/���W�^�����0@�@t煯˿�����s��o�i|3&0�  ����KϽ�8��Ҹ��׮��~ ��8�S�g�&r��kߍ?i�7/�ġ�iW���#b ��nw�F�&r���?��UO���}R��.Gp������^b����q�z�Eg~W�Mv؞@J�,�����z{�Rޕ�m�h�q�S X�����=>� 4�{��[�#����H��X���U�1�-��ړ-<���>�n����<{��gP}��/|��Y����z�����  �{�Sݦ��Zg���Iߟ����X{����-=t������DkϾ�'���}߿�1��I���Ѽ]�I���Ryzy7�V=y���ݿ�;��x����b.k\-85�������R/}��_��_��_���<�����W�G�{zCo� 2�6���ԋ3 ĥ�˫�̿_�U�k\�R�0�#ު>���z����/�Q����\��՗�x~�G��k�o��m<������ŷk�/8bۅܬ���E�s��>� t;yR�O.߂�{�n��\w�����׾?�\�e�^_�2R P�ߵWU��K���XƼ1� ̋��u�> U��|��
 ����|��/�c̛���\��LC]�ķ��ʇǗ�Cλ0?���)�_M��_���.�#�����"5:�{��V��"�Ⱥ	��p$p03�)v<z����t�Q�T�%���pfJ# A���r�,���� ����$�Rq3s�]vzvV�]f��%	��HM�������ч0H��H��2�M�=;s^�z�̊I�T�;|S��
�X��nv~��1�:-1s�Y��Px��K��٩�N��&�i-Pf��q�5�8�t����^�sV1nFK��d��5�9y`��O����U������2<;m'5���7��`K����\�w�>��1���3�F��u�vw�6���^������=f�C����_����;�}�Ƴs��;�<��������݋�`����W��J���xzp�pg�o�|����ac������'�壯:~�.3����?{��������/��c��q)�޳G1;s�ۿp?�����ߣf�?���|��l|��z��>�o8r�PV�ێ��;�}w����ׯ��M�{���E����_�|�'��ſ�s�G��n~~�G��������:�{�������|'/:,�gޝ֗v��o׿��5W==>{��\��
����{�P�������n�^{�����N0K�3�������7���}�������L�C����xT�C�����?����>�/�|��o��4ߡ`����>:_�����|��_;]W31�h����ݿ����o�?������/��>_U�J|�l0��\l�(���\ۧ&�z����Ɨ���}�t��N�=6����ӻ��v� ��|ܖw'��Q�40�Τ�wǹ�zd�.q�aT�)�Q�uI,�u�V������_�d\�ϊ���3ۯ[����N�ٺ��5)b�r�̎����j�HL�:X�*���U�C�#y�	�VAmNW���H#��U\#�����y�E��罳�JЕ�e���q�S�Jу>��)e���ǻK�4���)�*e<h�L�ТUT��F\C2�$�lt�Ė��h�[{oŭ�$ǥ:�"�	�E���L���g<O[�?\EW���h�r
F�AW��7��7�`|	[g������Kc��R�ti�ef�4j;33F.�.^��w�״o�����K������������b�����V[[�L���)�y�u,t�utP����L�\ɒx�xL���_|(�q�:^�0\0\�`�<=����(a"�����CG�Y��x����E�E�""̔P����G�92tF��V���`�Ƞқ��z�Ar���ng֐(&&V�%=���e�.|r+.�OV�hG� .>-#�Lo-��+ۮ9U$��������H���݊�ŸXgg�Z�vqT�L��02���{w���ן�ڹ��k}��Wd1���	A�F&Z��sn��FJ��m�,�� Ӟ�pqr���pðR]�h�d�:����o�2Y߽�����5��(V|���<R�b+Q��ސ���.1H	Q��j[+�
T)Uҭm}�ƕEYt���ΆS�"��>O;�g��ά�J�Wv��>�.�ʺ�����-p1XG�#$���1V���$���*%&�6����!�3�g{g���&-U
%-�\�����u`�#��4uWj;@�
]U�p�Ju�D�Im,��"�v��=����`�Y��F�\�$ؗ
uA	��ٯ��jy8Q�*�4+1�� ����H���Cn!S"S*.�@�Ѳ$�)%�p9�үDu�8`x�Pl%ד� ������n2W؍ݰs�,*N �vâH�ˇut W竳w�Ϊ�+@����u��u ���U2sq��<��JSp �!
`$���Ep�,�@�(�f.���>��,
�!4墺��n˞:���dF�������_iS��:�����C�ʃ�uq�bT�($�<��}�❘��]}��Ӂ)
�H]������/���V�
1�uF�)+�Ŕ);LL�4��DM��*��f�]m Zͮ��X�1���1��c0����<V�����خ��,Yx_t%{��??�R���`W ,�#UJ��Ju�4��*�51t�+H�h�0�����&�;!��4ܨ����\%?���UY�� �	����_�����80J�p����0sr�;�@�6�8s'sn�I����]��HБ�`	)�(�n�i�'$��Q�eO��}ZI�վ����������ϻz�b���T���������-}[�ǩ�H�#��g�ӷ��|�����m���>-��ƐIB7��?V~�������=~�c���<	٢k3���е'%�!��P��;����/����o���k����=����i�d��č�����-�A�e���'�I�qk��@�[�2#iBv��+�4�ꉫ���yz�D�&�z��8��v┸\�'=�����,U!���l�n��^�n>u����&uS|S|s�Ɠ��/�ߜ�^t��7_�2w��D����Q��F	H����{JVtCכ��Τkd���?4���] 7�}��W~����g'���ͬg�fo��zϖf4�< �6ܪ� Ӹ��}��Jt2���G�l���F
"̪x��	�����@��ye��%R���_S%
A�pT�@~"lI��Ƨ �8�@��am���ϗk�4 _��ֱ��E-�lօ���[�UF���f��䖕��jer�%[�U��Hr��p͖ad4��j�Y�:��"��q�B 9%H�:�YZ9c	s��L���@~C�W��U�!$� �+`Q�jT�6����������9�\9@ș�`ݝ���&��&� u��l��)��_����p
�WU��#$H���keJ�B��h<o0�Lg
�UT�U̓�)���pY/f�\�r�Ҋ�2d8o�(^ j,Z,��+�$?�]V#���E6a�h6!����`6T¼H	D�.�q��PQh#"��  �\.V.�\���M��e2����tԈM�L
�(3�X�H$Qb�b�FC!�Т�  sece�q���e�(��,V�ؙ�+�eW���A� �   :bD`��f �����`����M`�@ҋA ������
|� �	�����J��J~_6: ��)��E��R�N |c�UT"�*�T������Ng����aD�;�@��Mgu��T� �Fc7��#��ۈ�nd����rA� �(b���,��f1��Տ���Ѡ��1�A�b�Fa�*�t�utC�6-׵S��#�aby�ۛ�c��r��� ���]5X�
�f��?���皰�������P�j�RD�?�ɿ����;`��w]�<��Eը�c��*��pq�w>q7 ����ϷF�KY��\��7�9��  �V��)����.��[��3�z2ዱ�3@�VP �96vU  �6y�o�7� ���������.]
ߨ�|������m8�  ������7�'a5�\N ���W~}��{fҸ�AQ��v�V ��wt��j�pG���rw>>��y��:��@������~�N��h`*o�p�ҁ�ɈnP)T���8� 1���y�9xi�+G׿�:܀�s�!4�t���¦	Y%0a+��F�JD.��AP�hUۭ[�� 8h����'�}λ���/F�_  �=��ʟ����K��^�lH��}��* ��z-h#[ͳ��������Z���0j P>�N�zr�7���5[���|	m!{E6��W��k�%�ZR ƿ�o^� 
�gZ/?�q��\3|洰4! �,m ��������g랿M�w@�F�s�`����� ��,�l|it��)u�tS�$K��;d�{�o��م���X��W���~ng��3 �o���s������͍μϵ�K[�l�u��JM!��\l�E��G����Z���^}������}�/���\�ͽ�= t���[�N��������[9~�>v��J�N�.e(���b�x�B��f�����Ù��g���Kk�j��} ܀���x��   [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cg4womupu7au"
path="res://.godot/imported/Calculator.apple-touch-icon.png-656dce9a9d532a6692251afbb44eef2b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Calculator.apple-touch-icon.png"
dest_files=["res://.godot/imported/Calculator.apple-touch-icon.png-656dce9a9d532a6692251afbb44eef2b.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  �_[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://s6kjqemqctwb"
path="res://.godot/imported/Calculator.icon.png-1280cfb8e468aa89eaa1a00c7099b8bc.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Calculator.icon.png"
dest_files=["res://.godot/imported/Calculator.icon.png-1280cfb8e468aa89eaa1a00c7099b8bc.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�
�X�GST2      X     ����                X       �,  RIFF�,  WEBPVP8L�,  /Õ�mۆq�����1�Ve���G�N^6۶�'�����L �	���������'�G�n$�V����p����̿���H�9��L߃�E۶c��ۘhd�1�Nc��6���I܁���[�(�#�m�9��'�mۦL���f�����~�=��!i�f��&�"�	Y���,�A����z����I�mmN����#%)Ȩ��b��P
��l"��m'���U�,���FQ�S�m�$�pD��жm�m۶m#�0�F�m�6����$I�3���s�������oI�,I�l���Cn����Bm&�*&sӹEP���|[=Ij[�m۝m��m���l۶m��g{gK�jm���$�vۦ�W=n�  q��I$Ij�	�J�x����U��޽�� I�i[up�m۶m۶m۶m۶m�ټ�47�$)Ι�j�E�|�C?����/�����/�����/�����/�����/�����/�����/�����̸k*�u����j_R�.�ΗԳ�K+�%�=�A�V0#��������3��[ނs$�r�H�9xޱ�	T�:T��iiW��V�`������h@`��w�L�"\�����@|�
a2�T� ��8b����~�z��'`	$� KśϾ�OS��	���;$�^�L����α��b�R鷺�EI%��9  �7� ,0 @Nk�p�Uu��R�����Ω��5p7�T�'`/p����N�گ�
�F%V�9;!�9�)�9��D�h�zo���N`/<T�����֡cv��t�EIL���t  �qw�AX�q �a�VKq���JS��ֱ؁�0F�A�
�L��2�ѾK�I%�}\ �	�*�	1���i.'���e.�c�W��^�?�Hg���Tm�%�o�
oO-  x"6�& `��R^���WU��N��" �?���kG�-$#���B��#���ˋ�銀�z֊�˧(J�'��c  ��� vNmŅZX���OV�5X R�B%an	8b!		e���6�j��k0C�k�*-|�Z  ��I� \���v  ��Qi�+PG�F������E%����o&Ӎ��z���k��;	Uq�E>Yt�����D��z��Q����tɖA�kӥ���|���1:�
v�T��u/Z�����t)�e����[K㡯{1<�;[��xK���f�%���L�"�i�����S'��󔀛�D|<�� ��u�={�����L-ob{��be�s�V�]���"m!��*��,:ifc$T����u@8 	!B}� ���u�J�_  ��!B!�-� _�Y ��	��@�����NV]�̀����I��,|����`)0��p+$cAO�e5�sl������j�l0 vB�X��[a��,�r��ς���Z�,| % ȹ���?;9���N�29@%x�.
k�(B��Y��_  `fB{4��V�_?ZQ��@Z�_?�	,��� � ��2�gH8C9��@���;[�L�kY�W�
*B@� 8f=:;]*LQ��D
��T�f=�` T����t���ʕ�￀�p�f�m@��*.>��OU�rk1e�����5{�w��V!���I[����X3�Ip�~�����rE6�nq�ft��b��f_���J�����XY�+��JI�vo9��x3�x�d�R]�l�\�N��˂��d�'jj<����ne������8��$����p'��X�v����K���~ � �q�V������u/�&PQR�m����=��_�EQ�3���#����K���r  ��J	��qe��@5՗�/# l:�N�r0u���>��ׁd��ie2� ���G'& �`5���s����'����[%9���ۓ�Хމ�\15�ƀ�9C#A#8%��=%�Z%y��Bmy�#�$4�)dA�+��S��N}��Y�%�Q�a�W��?��$�3x $��6��pE<Z�Dq��8���p��$H�< �֡�h�cާ���u�  �"Hj$����E%�@z�@w+$�	��cQ��
1�)��������R9T��v�-  xG�1�?����PO�}Eq�i�p�iJ@Q�=@�ݹ:t�o��{�d`5�����/W^�m��g���B~ h�  ����l  נ�6rߙ�����^�?r���   ���⤖��  �!��#�3\?��/  �ݝRG��\�9;6���}P6������K>��V̒=l��n)��p	 ����0n䯂���}   ���S*	 ��t%ͤ+@�����T�~��s����oL)�J� 0>��W�-  �*N�%x=�8ikfV^���3�,�=�,}�<Z��T�+'��\�;x�Y���=���`}�y�>0����/'ـ�!z9�pQ��v/ֶ�Ǜ����㗬��9r���}��D���ל���	{�y����0&�Q����W��y ����l��.�LVZ��C���*W��v����r���cGk�
^�Ja%k��S���D"j���2���RW/������ض1 ����
.bVW&�gr��U\�+���!���m ;+۞�&�6]�4R�/��Y�L�Ά`"�sl,Y/��x��|&Dv�_
Q*� V�NWYu�%��-�&D�(&��"  Wc��ZS���(�x� ,�!����!�L�AM�E�]}X�!��wB�o��-  �-���16���i���ю�z��� ���B��oB�0������v]���ȓ�����3�� +S�χ�=Q_�����˨�d��|)D>��k ��uȣ���Y[9̂�����! ^�!��r���j0Y+i��΍e(�ț� ���x��
��{��<6 R���پ�b��Y
C����+���������;���a ���,�o��bC�{�?���1 �(��¤ �V�������;�=��I��� ���EI���Z��)D����t=S ��] X��9K�= �.~�K[��Ŋ��,2��� p}>w<n�g h�
�t���R�u�G�1k���!��x���������� �L���|>D�0�Ǣ(Qc�� ����= �ۊ�Z0�^��c �
|�����L�%�d��q���(�WB� ��(	���� �J��8D�0�~$�Dsy�Ѿ!������j�^ ��mOa�8.�qce��s|%Dq~,X�u�������=T	���Q�M�ȣm�Y�%Y+�[�0|"DΞ�j�u�L6�(Qe��qw�V�э���ǂ���!j�K � �:�wQ�dÛ������R�
��C���X�u�`����\"j讀Dq21� �F>B[��[������]@K-���C�e�q�tWP�:W�۞X�z��,��t�p���P��Se����T���{dG��
KA���w�t3t��[ܘ�4^>�5ŉ�^�n�Eq�U��Ӎ��α�v�O6C�
�F%�+8eů��M����hk��w�欹񔈓����C��y訫���J�Is�����Po|��{�Ѿ)+~�W��N,�ů��޽���O��J�_�w��N8����x�?�=X��t�R�BM�8���VSyI5=ݫ�	-�� �ֶ��oV�����G������3��D��aEI��ZI5�݋����t��b��j��G����U���΃�C�������ق�в����b���}s����xkn��`5�����>��M�Ev�-�͇\��|�=� '�<ތ�Ǜ���<O�LM�n.f>Z�,~��>��㷾�����x8���<x�����h}��#g�ж��������d�1xwp�yJO�v�	TV����گ�.�=��N����oK_={?-����@/�~�,��m ��9r.�6K_=�7#�SS����Ao�"�,TW+I��gt���F�;S���QW/�|�$�q#��W�Ƞ(�)H�W�}u�Ry�#���᎞�ͦ�˜QQ�R_��J}�O���w�����F[zjl�dn�`$� =�+cy��x3������U�d�d����v��,&FA&'kF�Y22�1z�W!�����1H�Y0&Ӎ W&^�O�NW�����U����-�|��|&HW������"�q����� ��#�R�$����?�~���� �z'F��I���w�'&����se���l�̂L�����-�P���s��fH�`�M��#H[�`,,s]��T����*Jqã��ł�� )-|yč��G�^J5]���e�hk�l;4�O��� ���[�������.��������������xm�p�w�չ�Y��(s�a�9[0Z�f&^��&�ks�w�s�_F^���2΂d��RU� �s��O0_\읅�,���2t�f�~�'t�p{$`6���WĽU.D"j�=�d��}��}���S["NB�_MxQCA[����\	�6}7Y����K���K6���{���Z۔s�2 �L�b�3��T��ݹ����&'ks����ܓ�ЛϾ�}f��,�Dq&������s��ϼ��{������&'k�����Qw窭�_i�+x�6ڥ��f�{j)���ퟎƍ3ou�R�Y����徙�k����X�Z
m.Y+=Z��m3�L47�j�3o�=�!J
5s���(��A ��t)���N�]68�u< Ƞ��_�im>d ��z(���(��⤶�� �&�ۥ� ��  Vc�8�'��qo9 �t��i�ρdn��Of���O�RQP���h'������P֡���n ���č����k�K@�>����pH>z)-|��B��j���!j:�+������˧��t�������1����.`v�M�k�q#�$���N:�����-M5a10y����(�T��� X5 \�:� ?+�7#�?�*Y+-,s� ~�|\)뀀ap �drn�g��RN�X�er ��@ĕ���;��z��8ɱ�����	�- �
�bKc����kt�U]�䎚���hgu���|�_J{ �`p��o�p�T�U��p���/���Hϑ�H�$X ܬm3���ŉ�U'��뻩t��G9�}�)O������p�΃g���JO���\9�׫�����ڳ�!k����/��9R���^�%��C����T���;ji<�>�KY����;�J��ƶm .P��pT��
@HA��r��98V���b�v���YwaZ>�$oւ?-փ��ʹ|0�.��3���b駁�c��;?8E;���V�B�؀����|%\\s��%����e{o��Z�i�������^���s�Jx������B jh�\ �h�<��V��sh@:���.�ІYl��˂�`3hE.,P�2^����J��+�����p��
�ЊJd��x�*�@�7R��� �"�G="!�� �p����u�o��wV�m�g���~F��?����/�����}~����sо7� ���\,,k�J�T�6������Z�y�rBZ[D�>v�HQ�R��mq�������DD�-6+�V`���J�E�����\� 9!ߑ�`��6���ml�~ZM�Z�ȎV���g���������3?*u3���ctW����YQa�Cb�P�,B5�p0�m�cͺEt�{,��>s9f�^��`OG��]����2�Fk�9_�G�vd��	��)��=�1^Ų�Wl3{�����1��H)�e������9�هZ�]}�b���)b�C��es}�cVi~x���e
Z�)܃��39������C�(�+R����!�j����F�n���<?�p��l�8a�4xOb��������c�8&�UA�|	/l�8�8���3t�6�͏���v���� ����סy�wU��`� =��|M�Y?�'�A��&�@*�c~!�/{��),�>�=xr"	�qlF:��L&���=<5t�h.�#ᣭ���O�z�!�&`A�F�yK=�c<\GZ�� 4HG�0i�F녠uB"���<��c�Jeۈ�3!����O��q萞PiZ&�$M[���(G��e���ؤ���ã��O���5����'�gH~�����=��g�F|8�+�X�4�u���G�2����'��.��5[�OlB��$f4���`��mS�L�,y�t&V�#P�3{ ��763�7N���"��P��I�X��BgV�n�a:$:�FZ���'�7����f������z!�����KA�G��D#������ˑ`ڶs���&� ݱ��4�j��n�� ݷ�~s��F�pD�LE�q+wX;t,�i�y��Y��A�۩`p�m#�x�kS�c��@bVL��w?��C�.|n{.gBP�Tr��v1�T�;"��v����XSS��(4�Ύ�-T�� (C�*>�-
�8��&�;��f;�[Փ���`,�Y�#{�lQ�!��Q��ّ�t9����b��5�#%<0)-%	��yhKx2+���V��Z� �j�˱RQF_�8M���{N]���8�m��ps���L���'��y�Ҍ}��$A`��i��O�r1p0�%��茮�:;�e���K A��qObQI,F�؟�o��A�\�V�����p�g"F���zy�0���9"� �8X�o�v����ߕڄ��E �5�3�J�ص�Ou�SbVis�I���ص�Z���ڒ�X��r�(��w��l��r"�`]�\�B���Ija:�O\���/�*]�þR������|���ʑ@�����W�8f�lA���Xl��촻�K<�dq1+x�*U�;�'�Vnl`"_L�3�B����u�����M���'�!-�<;S�F�܊�bSgq� ���Xt�肦�a��RZ�Y_ި��ZRSGA��-:8����yw_}XW�Z���-k�g.U��|�7P�
&���$˳��+��~?7�k�bQ���g������~�Z�e����H�-p�7S�� 
�w"XK�`K%?�`Tr|p���"��\�a�?�٧ ��'u�cv�&��<LM�Ud��T���Ak��������'+7��XR`��[\�-0���e�AiW]�Dk���$u���0[?�-���L����X�ĚSK-�.%�9=j�3t^���(c�yM-��/�ao����\%�?�б �~���b][
tٵ�<qF�)�
�J�'QZY�����*pB�I4�޸�,������.Т�1���/
t�1-1������E�*��Cl/Ю©f�<,0�S�bf�^���[8Z$��@���kw�M<?�[`��)3)1� �U����:��/pR��XV`XE,/0���d���1>ѫ��i�z��*o�}&R{���$f�JV=5͉Ύ��Rl�/�N4.�U~Cm�N~��HPRS�?G��g�-���qvT{�G _�[ua�;���kco�9�Kw����n����E{d�j��C���,q����Y���cwY<$#�ؤ�m+�LL-�z� �y<{/7���[��X�?�-6(cO ?�XZ�M�������sb�[
�.����j|;d�!0lCIqZ�z�&��~�|7�A���A~��á@�� 417��}t ��,� X�6��lS)6v�G
��I:�).~��8R���#'��߶;9�'���U�$1nC�L��찦3�+b黙u�NJ�����8���X�?5�0��^��[B/+�0�Ur(��J��+Xr�H�����HZm&�#�p	�Y ����*���hM]��m���b�ݢ����G����s��z-�x��������� �J�"���Ћ�g�Ҝ �Aа��?��?6��c�Zx�$�t��{s
-R�E�24�?�{�l�-��1�3S�EJ��v6X]L�B^ ��]N��R�yN��62�����'R�p-�����n2�d�?Th|�h��3X������Rc8&��_,��;T�8�� �hΗv�(7I;�3Obn;��O�!����Lߍ*�E~wU,���n�MN1���Z��Y̖��tY;5�^�<Z�Ǩ�T#�bt�xfA�n�cq����"9GD*�^JL��HJ���4���V�-�܉��4*��u]�[
���,"ҏ�i!�r~L��_�����8 ]j�?x���<k+%w��Bk��=�u�ڤ��>%2Bۃ�Y�n<jBo������Κ�0M~�t>�#b/jZ�}���B��Q��#���6R$v�����k�R$c/:�~���(V�7;)��ߊ[̣0?F��;.�*ݪd������{A`w>~�i=D�c��������Y2�X�q~�r2��8@v=f�?��X��S�"X�j?��@$?�����x�(�k���c7��\�����>A�=fpM?9d?�׻{���)f�.⪝���3�������f,N;"��,N���X��*�"V���"��C��?���(2=���A��1�Ul���h�8Ao(5X�B�X�>S�j��s�!
l����GgGp��>�v;c���V�N1���-��K�S�=6PiN�fNq������,
�3SWx�ei����f'�*�r�rʹ̙�e�7���b�o���>_i��M�_��V�p�r�9��X�$�����B���t5�4#�B(E���3�������`����I�M�e��b6_����{~�f/��@��B��Y����E�4��޲�d�O�$���M�����ݖv�P����TR�oj~��+}��#���"�]1Υ_���nR���œ����^pQ2�7첾b��3�ba�\��uu2�~O�G�����5�^>v������m��?���mC;$eT��C񎋋��V��8�:��
���ʱlt��~e]�cC7dl���.�i����\w����/..F�Q5���œ��`�o���E����E�͛�ٽ-�o�z�"n��/��[�����ͳI���S��Dڢ��V�6��!��esq��AC���ڻ���OMk�y��{7`c0�ٺ���5C5�yiw��`ps�OC��f�X�5oQ�\_*m�f�)稹"���a2$O;�]C�A�;V.���c��iޢ�R5�X��t%�s����ȸ�; 5�����)��X|?����9&��wĽjdn�{��7��/����q]3Ɲ�}�[��yF~�Q0����x��U�� ���˘?����a�;���/yޫ�����6.��C}���&L��9�_�ս�w�o���W�^�;�^u�xoݖ��Q8����4��kW��'����:9>����Xp5H��ONtL��=��_�&�0��H"Q��|H���4!���]�'�!޹Eܢ���}=soϢ~	K�$���`"!]j�+{'e�M��D]��=�>c��xS��Y����X��7�7+�Me̯/���u�Q����i���Eg�9�g�RU��#'��ޑW\r�aS�/3�"/v
IgX���}ٻ���ʏr�r���_��<�6�Gʋ&���z%�Pl^d����㑭v�ʎو�w�[���Q��k�K�����IWˈ��`/�Y�X��9J"��_��V{��je�i��6�<�ZS��� �t���W�Bg��@5���..��X�eʡ��*�HRgkD^>�y裝"�9�+wQ4ABR������^�k3�>2�����x�C�l���f:��#gщ�s� ��ߜ��ȁ���+���A��˾�g�1K9Cܹ��:���T"!I������Hs�;���ue��9@#ChE5&!��'�2�����w*a/Q��I	�E������I�w�����?��v })B��GQ�n�h"]0��]Z֑���.}�&~x2��
eĞsF�n�+�b�e�i����0Ix�y��Aѕ���
[1�B�R$$����:�4E疳��#�4���y���ӈ�6o1O�V'��7]�H�.)/)�OwW./�g�l��£���"$d���}[���t���U~�MQԲ�$��~��c��S�M�a���ш=��diH��(N�+U�D����f"V�"�����.ƈ�#Ͼ�eH:�x��d!k 6�J�f9�GW�4����Kp��T��3��~��G�؀��,�zZ��澰؋7����v#� &�r+O�@Ud7͐�$�\�D�O��W_�Ew�ͻ�7��oD����y��,��Ƣ�cƙd	���U�u�:�#�h6]�R
�U~	V�՟R�V������/�:r�F¬�k?|Ī�r\�<.�^9����?��]Aʻ�iT;vg�PpyM���1��},�dY\e8��I��2�wjM��S/�p�1�\^�6$4�F��(:�\nۢ�2�}�Pm�X�'.����U�3��bq�nXK�i_BD�_H}�r;Y^�t�<���o��#gw��2q_�|�^�<��E�h���O�����R�-Ɖ���S�	!��z�1�+iH�1G���+<����~�;|�F�{�}v�;s�j�Q;�٩�;&f�}�������tL ���#��Ъ>;��z���?U˽�~������e��{K%��/:F�/<�n�2k�8�x��S-�5�`��ԗ�H�{���R�y�S�(w��ѥe
�	0���w�޻�U1��7V-Q�̶ꪸ�g�X��3V&�T[+)b����2���(���B��,��z����9���B`��!��o�ע(�W�RZ���m��%/V�&��|g��f��*[_��nn��M�M`�%��)��Z�K$�����F�� ��$r^�k�K,	u;w������X���;�L�eoI�6��y%����~����)���0"�zc�BH�<�kW�E\.�b��R>mٺ��<����͑Թ���a=2X���=/��_;	Ρ�e&o.����]��2!�嫈�"I������j�höR��͒\L�0�e������,)ýf�; ��E��0��<%�Q�Aø�x8�� �]eQL�;|���꼬z�W2
�H�z�_��
/K`J�O�O�Y�~j���>����d�v��%�ެ7�4{%��٥7Z��>����|��5^�\ױ���:��Z^;��U��s�)��#�|�.̡���R2��j����şBб���*cMvD�W^{�������m�D��0�,������#���?O����
����?z�{ȓ'�|����/�����/�����/�����/�����/�����/�����/�����/|� 2�`�7ű���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://duh3ibfh4odk1"
path="res://.godot/imported/Calculator.png-7193292291731408716d3181ee51908d.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Calculator.png"
dest_files=["res://.godot/imported/Calculator.png-7193292291731408716d3181ee51908d.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
� ��GST2            ����                        <   RIFF4   WEBPVP8L'   /� ���J�a�8�P�n�2�"D�?{� ���P�K�i�Rd�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://mdt88a7vttjh"
path="res://.godot/imported/dirt.png-81db9f47be16674f640109976e043256.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://dirt.png"
dest_files=["res://.godot/imported/dirt.png-81db9f47be16674f640109976e043256.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
p�@ɓ�extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").add_text(str(" / "))
���۬]�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://divide.gd ��������      local://RectangleShape2D_wb1vq R         local://PackedScene_6m4mh �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         divide    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                /             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRCt�(Y�s��햃extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").calculate()
��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://equals.gd ��������      local://RectangleShape2D_wb1vq R         local://PackedScene_1f67h �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         equals    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                =             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC�x4ٳ�j����kaGST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  �X[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dlm8bok204lcq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
U�:jextends Node2D

func calculate():
	var expression = $HUD/Calculator.text
	var postfix = Calculator.infix_to_postfix(expression)
	var result = Calculator.evaluate_postfix(postfix)
	$HUD/Calculator.text = "Result: " + str(result)

func add_text(text):
	
	if $HUD/Calculator.text.contains("Result"):
		$HUD/Calculator.text = ""
	
	
	var newText = $HUD/Calculator.text + "" + text
	
	$HUD/Calculator.text = newText

func clear_text():
	$HUD/Calculator.text = ""




func _on_button_button_down():
	Input.action_press("ui_left")


func _on_button_button_up():
	Input.action_release("ui_left")


func _on_button_2_button_down():
	Input.action_press("ui_right")


func _on_button_2_button_up():
	Input.action_release("ui_right")


func _on_button_3_button_down():
	Input.action_press("ui_up")


func _on_button_3_button_up():
	Input.action_release("ui_up")
5d.� J��rM�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity '   0:0/0/physics_layer_0/polygon_0/points    0:0/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/0 
   sources/1    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled       Script    res://main.gd ��������
   Texture2D    res://dirt.png �{����
   Texture2D    res://stone.png V�P���?   PackedScene    res://number.tscn $����   PackedScene    res://add.tscn F/U���nY   PackedScene    res://times.tscn �tޣQf9   PackedScene    res://sub.tscn �H��|�   PackedScene    res://divide.tscn �ym�+\   PackedScene    res://equals.tscn z[�}�c�   PackedScene    res://c.tscn ��C�l   PackedScene    res://player.tscn -x}���[   !   local://TileSetAtlasSource_5ropq       !   local://TileSetAtlasSource_3pjux �         local://TileSet_34qwx 9         local://PackedScene_d20tt }         TileSetAtlasSource                             
           	          
   %         �   �   A   �   A   A   �   A               TileSetAtlasSource                             
           	          
   %         �   �   A   �   A   A   �   A               TileSet                                               PackedScene          	         names "   4      Main    script    Node2D 
   ColorRect    offset_right    offset_bottom    color    TileMap 	   tile_set    format    layer_0/tile_data    HUD    CanvasLayer    Calculator    offset_left    offset_top !   theme_override_colors/font_color $   theme_override_font_sizes/font_size    text    horizontal_alignment    vertical_alignment    Label    Button    Button2    Button3    Number 	   position    number    Number2    Number3    Number4    Number5    Number6    Number7    Number8    Number9 	   Number10    add    times    sub    divide    equals    C    Player    _on_button_button_down    button_down    _on_button_button_up 
   button_up    _on_button_2_button_down    _on_button_2_button_up    _on_button_3_button_down    _on_button_3_button_up    	   variants    :                  �D     D       ��f?��g?  �?                   D                                                                                            	          
                                                                                                                                                                                                                                       !          "          #          $          %          &          '          (          )          *          +          ,          -          3          4          5          6          7          2          1          0          /          .          8          9          :          ;          <          =          >          ?          @          A          B          C          D          E          F          G                                                                                                                                                        	          
                                                                                                                      G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G         G 	        G 
        G         G         G                                                                                          	          
                                                                                                                                                                                                                                       !          "          #          $          %          &          '          (          )          *          +          3          4          5          6          7          8          9          :          ;          <          =          >          ?          @          A          B          C          D          E          F          2          1          0          /          .          -          ,                                                                                                     	         
                                         !         !         !         "         "         "         "         "         "         #         #         #         #         #         $         $         $         $          $        ! $        " $        # $        $ $        % $        & $        ' $                           !         "         #         $         %         &         '         (         F         F         F         F         F          F !        F "        F #        F $        F %        F &        F '        F (        E (        D '        C '        B '        A '        @ '        ? '        > '        = '        < '        ; '        : '        9 '        8 '        7 '        6 '        5 '        4 '        3 '        2 '        1 '        0 '        / '        . '        - '        , '        + '        * '        ) '        ( '        ' '        & '        % '        $ '        # '        " '        ! '          '         '         '         '         '         '         '         '         '         '         '                                                   !          "          #          $          %          &          '          (                                     !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (                                              !         "         #         $         %         &         '         (        	         	         	         	          	 !        	 "        	 #        	 $        	 %        	 &        	 '        	 (        
         
         
         
         
 !        
 "        
 #        
 $        
 %        
 &        
 '        
 (                                             !         "         #         $         %         &         '         (                                             !         "         #         $         %         &         '         (                                             !         "         #         $         %         &         '         (                                                       "         #         $         %         &         '         (                                                       "         #         $         %         &         '         (                                                       "         #         $         %         &         '         (                                                       !         #         $         %         &         '         (                                                       !         #         $         %         &         '         (                                                       !         #         $         %         &         '         (                                                       !         #         $         %         &         '         (                                                       !         #         $         %         &         '         (                                                       !         #         $         %         &         (                                                       !         "         $         %         &         (                                                       !         "         $         %         &         (                                                       !         "         $         %         &         (                                                       !         "         $         %         &         (                                                       !         "         $         %         &         (                                                       !         "         #         %         &         (                                                       !         "         #         %         &         (                                                       !         "         #         %         &         (                                              !         "         #         %         &         (                                                   !          "          #          %          &          (        !         !         !         !          ! !        ! "        ! #        ! %        ! &        ! (        "         "         "         "          " !        " "        " #        " %        " &        " (        #         #         #         #          # !        # "        # #        # %        # &        # (        $         $         $         $          $ !        $ "        $ #        $ %        $ &        $ (        %         %         %         %          % !        % "        % #        % %        % &        % (        &         &         &         &          & !        & "        & #        & %        & &        & (        '         '         '         '          ' !        ' "        ' #        ' %        ' &        ' (        (         (         (         (          ( !        ( "        ( #        ( $        ( %        ( &        ( (        )         )         )         )         )          ) !        ) "        ) #        ) $        ) %        ) &        ) (        *         *         *         *         *          * !        * "        * #        * $        * %        * &        * (        +         +         +         +         +          + !        + "        + #        + $        + %        + &        + (        ,         ,         ,         ,         ,          , !        , "        , #        , $        , %        , &        , (        -         -         -         -         -          - !        - "        - #        - $        - %        - &        - (        .         .         .         .         .          . !        . "        . #        . $        . %        . &        . (        /         /         /         /         /          / !        / "        / #        / $        / %        / &        / (        0         0         0         0         0          0 !        0 "        0 #        0 $        0 %        0 &        0 (        1         1         1         1         1          1 !        1 "        1 #        1 $        1 %        1 &        1 (        2         2         2         2         2          2 !        2 "        2 #        2 $        2 %        2 &        2 (        3         3         3         3         3          3 !        3 "        3 #        3 $        3 %        3 &        3 (        4         4         4         4         4          4 !        4 "        4 #        4 $        4 %        4 &        4 (        5         5         5         5         5          5 !        5 "        5 #        5 $        5 %        5 &        5 (        6         6         6         6         6          6 !        6 "        6 #        6 $        6 %        6 &        6 (        7         7         7         7         7          7 !        7 "        7 #        7 $        7 %        7 &        7 (        8         8         8         8         8          8 !        8 "        8 #        8 $        8 %        8 &        8 (        9         9         9         9         9          9 !        9 "        9 #        9 $        9 %        9 &        9 (        :         :         :         :         :          : !        : "        : #        : $        : %        : &        : (        ;         ;         ;         ;         ;          ; !        ; "        ; #        ; $        ; %        ; &        ; (        <         <         <         <         <          < !        < "        < #        < $        < %        < &        < (        =         =         =         =         =          = !        = "        = #        = $        = %        = &        = (        >         >         >         >         >          > !        > "        > #        > $        > %        > &        > (        ?         ?         ?         ?         ?          ? !        ? "        ? #        ? $        ? %        ? &        ? (        @         @         @         @         @          @ !        @ "        @ #        @ $        @ %        @ &        @ (        A         A         A         A         A          A !        A "        A #        A $        A %        A &        A (        B         B         B         B         B          B !        B "        B #        B $        B %        B &        B (        C         C         C         C         C          C !        C "        C #        C $        C %        C &        C (        D         D         D         D         D          D !        D "        D #        D $        D %        D &        D (        E         E         E         E         E          E !        E "        E #        E $        E %        E &        E '        G         G         G         G         G          G !        G "        G #        G $        G %        G &        G '        G (             �C     �B     $D     BC                 �?            
             �B      D     0C     D      <--      HC     �C      -->      nD     �D      ^
          
     �B  �C
     C  �C
     XC  �C      
     �C  �C      
     �C  �C      
     �C  �C      
     �C  �C      
     D  �C      
     D  �C
     &D  �C                
     vD  �C         
     fD  �C         
     VD  �C         
     FD  �C         
     �D  �C      	   
     6D  �C      
   
     D  �C      node_count             nodes     !  ��������       ����                            ����                                       ����         	      
                        ����                     ����	                  	      
                                                  ����                                                  ����                                                  ����                                             ���                                 ���                                 ���                                 ���                                  ���            !      "               ���             #      $               ���!            %      &               ���"            '      (               ���#            )               ���$            *      +               ���%   ,         -               ���&   .         /               ���'   0         1               ���(   2         3               ���)   4         5               ���*   6         7               ���+   8         9             conn_count             conns     *          -   ,                     /   .                     -   0                     /   1                     -   2                     /   3                    node_paths              editable_instances              version             RSRC�1RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://C.gd ��������      local://RectangleShape2D_wb1vq M         local://PackedScene_enmme ~         RectangleShape2D       
     @B  @B         PackedScene          	         names "         min    script    StaticBody2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    	   variants                      ��     �A   ��?��?      �?                1             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count              conns               node_paths              editable_instances              version             RSRCBextends Area2D

@export var number:int = 0

func _ready():
	$text.text = str(number)

func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").add_text(str(number))
ֽZRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://number.gd ��������      local://RectangleShape2D_5v8y4 R         local://PackedScene_3rjrv �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         Number    script    number    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                    	        ��     �A   ��?��?      �?                1             node_count             nodes     :   ��������       ����                                  ����                           	                  
   
   ����                           ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC�eextends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			$"1705723842549".flip_h = false
		else:
			$"1705723842549".flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
b@nRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://player.gd ��������
   Texture2D    res://1705723842549.png o\A?j�w      local://RectangleShape2D_mam8k �         local://PackedScene_i0w3x �         RectangleShape2D       
     �A   B         PackedScene          	         names "         Player    script    CharacterBody2D    1705723842549 	   position    texture 	   Sprite2D    CollisionShape2D    shape 	   Camera2D    zoom    limit_left    limit_right    	   variants                 
         �?         
     ��  �?          
     �?  �?          ~        node_count             nodes     ,   ��������       ����                            ����                                 ����                           	   	   ����   
                            conn_count              conns               node_paths              editable_instances              version             RSRCj�?r���F$MGST2            ����                        ~   RIFFv   WEBPVP8Li   /�  H�r^p�@��3��k�b��0����F����!&�e���{��r�7T����?�ǿ�����=$��I0h��B��9W�i@�T� �l�D�y�=�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b6p8ait3rom0u"
path="res://.godot/imported/stone.png-083619ed9cb60da6213c6ca04d200509.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://stone.png"
dest_files=["res://.godot/imported/stone.png-083619ed9cb60da6213c6ca04d200509.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�7�extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").add_text(" - ")
qHI���;,�����RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://sub.gd ��������      local://RectangleShape2D_wb1vq O         local://PackedScene_ns1at �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         sub    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                -             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC���extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		get_node("/root/Main").add_text(" * ")
%��E�tc��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://times.gd ��������      local://RectangleShape2D_wb1vq Q         local://PackedScene_ol6g7 �         RectangleShape2D       
     @B  @B         PackedScene          	         names "         times    script    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    CollisionShape2D    shape    text    horizontal_alignment    vertical_alignment    Label    _on_body_entered    body_entered    	   variants                      ��     �A   ��?��?      �?                *             node_count             nodes     8   ��������       ����                            ����                                             	   	   ����   
                        ����                                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC]l7��+�UݻH�[remap]

path="res://.godot/exported/133200997/export-1c89a0432646758217dc884e209d3648-add.scn"
[remap]

path="res://.godot/exported/133200997/export-a14e416984f3994a7131603b2d16717d-c.scn"
��[remap]

path="res://.godot/exported/133200997/export-6df5da4c24ca1f5d10af08562b210af6-divide.scn"
�����	����XO[remap]

path="res://.godot/exported/133200997/export-84253810b8f99f1280c59e6b36e176d6-equals.scn"
�ѧ/ Y��.F�fR[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
�����~M�ۮ�&�[remap]

path="res://.godot/exported/133200997/export-5cb0866679a2eab282af4d4a9e66c5c1-min.scn"
[remap]

path="res://.godot/exported/133200997/export-9862176e57e698d497b972795114153d-number.scn"
�]�(�gZ�lx�U:[remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
Q|�&�!�Ko�[remap]

path="res://.godot/exported/133200997/export-2b8b471b708485a66f3d486946c5d76b-sub.scn"
[remap]

path="res://.godot/exported/133200997/export-21eceac58a1f94cd98f0bda286fe54dc-times.scn"
f�k#�>�C��ë�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
\H   o\A?j�w   res://1705723842549.pngF/U���nY   res://add.tscn��C�l   res://c.tscn�{����   res://dirt.png�ym�+\   res://divide.tscnz[�}�c�   res://equals.tscn���6�pn   res://icon.svg��|h�   res://main.tscn$����   res://number.tscn-x}���[   res://player.tscnV�P���?   res://stone.png�H��|�   res://sub.tscn�tޣQf9   res://times.tscnI�;n   res://Calculator.icon.png��:F�%%   res://Calculator.apple-touch-icon.png��;�tw   res://Calculator.pngȇ��?,ӭ�@�^ECFG      application/config/name      
   Calculator     application/run/main_scene         res://main.tscn    application/config/features   "         4.0    Mobile     application/config/icon         res://icon.svg     autoload/Calculator$         *res://Global/calculator.gd    input/ui_left|              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode    A      physical_keycode       	   key_label             unicode    a      echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script         input/ui_right|              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode    D      physical_keycode       	   key_label             unicode    d      echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script         input/ui_up|              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode    W      physical_keycode       	   key_label             unicode    w      echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script      #   rendering/renderer/rendering_method         mobile  4   rendering/textures/vram_compression/import_etc2_astc         9   rendering/textures/canvas_textures/default_texture_filter          �$�2]��