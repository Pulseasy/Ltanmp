#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�9�
Vcentos.sh �<ks�Fr�5�b��,�a���5�㮸^��I~ll�$,�1�$������\�Ury��R�T]�u_.v>�|����x�{�"�3 �%��]չ��	��������g0��k��㕺&�U�E?ܤ��1���t�������o �=��� ���R���L�PX��D��[�|����������f�/J�y��Ev��?`�	uzt�YHNCߏ<�G��tl��n�k-Z(�wi4`���Y�:a��=�Gt8��2Q�F>GP?n�N�F���a5���ԍLo$�s'��s�곿��O?��;z����_��XfD�x��"�2`������"o2��f�l��=���ɮ�}?���Ԍ"6"�Y��3d�(��Џ���!��*����?��Ы�$�Z]���7l�_���R?�ɏ�����?��w�����xQ@�1�:��v	@6le�� l���|��/�ݳM�!����Pe�zT�T���Y��1����6w������pԙb'�������:<��7�$�YP�jgDz�mZ����b.oВ�NK�lP}�F� -NK�&C���^I�(ZKO�Z�����A�L���"�g��,�8���F�����"��Xju�.�<{h:�#x�3uo�Xf��<��G/���o�o~������/~��7��ճ����%��i-<�,�E���^����i!��1�I�%W����
jס���=��x�#���M��<[-�uAJ�;'C�&CC�f	Q��	Q���0�VȆ��BV� ��9�|���=s�.�|��/�E,B���EE��a��Ͼ��x�w?��q�?v2�)�/�]���	}�m8�`0�'�ɇ��E�Q�+u�Z����b�J���5ʒy6y�\�����l�j��
��FMd��W1��-��R��\� =�Y�����>���G0�:S 8D]���,���OVe�z��$Cp��TvzN�1��%��.��;�~j\'�y��`��Ý������!�2��M�!8Ў����G��:0�y4)U��%Pu�ő�E�-8.�7&��y}�cw���������v�<<�fR2ǜ���m臌�M��L���*$�%�F���{P���턭�7�3�!}(��1�ȕM`rY�MVa@�*�M��H�����"L��E�ߓ7�@�LȿZ���z�ȝ�m�R�64YY�p=	,PHަ��J�l�VZl��h�����J�⶚���v�n�[3+�f7	D^ۧc�-�L/�/�ٶ=�ߺ��!ţ�XJ���$�8���
�Dܭ�֗�J��4ĄQ�h�M:����	<���EbĠ�Q��mJL�B�������飧���s�t�1^;�����V�&�g0N-֬0g�1���%+�ӽ�{�ӽ�����۟罷����Bf3`�',���:���׎�8�U�Úq�"�i�|�l�X�Q�mr�/�^��oqE��km+�`Eu���5^K��q%�piJ�BP�^�A�I�`�'RJWJH���i�Va�K;�3�x!˞�>rQN�%�po�2�]�O욡c�CN��
9���"���arYm\�{()2\Da^�Mf�,d������E!������N�����u.ك�,�+�t^�,���ъ��˗�>J��Q�Wt����,�\�y�(������׉q0�����oBu����۝����G��<����LV�
��.4�	Y�m��Zb�]ު�e�Ep�&VVb�y�n̮O�$+��:O�W���06F?�&]�y���Q�ޱe���\(�
�Ǫ=&�7�,��oÄN�$h�1�M$���#FVF�rF5������ǽ�h�1�, �5�Nh�c�oC��׫�S���������ଛ���1�O��=�u��b�_��?2�
�8�����b
��N(�O1��1^��j-)iN�۳P���	�ZDTU͕�$b��_˒���+]�@du��f&qGL�����sZR���,�3�-��Qgg{�w['p̬'[r�K�b31)��K9�H?�.���m�s�٬�ߞ�n���B��́i�@��HpA��'�Z�oY��fݹ#���u�s�9�:����Z�����jp�b�+�<a��\���֏�Sh���%��'7
޷�?u� lr3-{>t��UA�����9�mU�*H��T��\�+�7��(̂9�L]�zf�B�ϧw
sv��gZ�c{�`~�<�'W=u����	R��O{�q�@脡�K�Σ��7V|�����1����@��q:�y�Ǟrq1�O���3~�I"҉�,m����<�7��A\ļ�+�xG�>ǗY�P� ��Ea�vиc̐��\�?���/y�I����bP4.gSZ�Bh�NxE�k׮�� <��?�I��Z9+:�4�Y�	)DZ'��,�)I��N�"��S���	��D#+dZS�Tg��3K0QGi3��,�"]�Ue���b�t��w�x��[�.�D��,sI:e�N�N?`aG �U�j�bytt�+vI�尟j����DĞk"���z4�^F���|�3"J$��ļ#W�L���e���v�0𻦏����`)��t�ɚ�紱�C��8�YD-�U貚9�wF;��Z��W/�n����.M�L�s�	f[���b<��$
�-���e./
���jh�� 7�Cw��+�l�fY���m�r�S�&he}C��(�I�@��2��hY��Z�Z7�[,�f�NE.K�y��Tm��6LU��tB��^�3���m�R�����\V��Lei��*��~��B����˵<�3�H�Y�4��Z]����ڝ����mS�� Z˦���rB@������?���%���QȨ�!�9��N�9k57nȕ�� S]/��12��L�g�`�Ti�>r��ViV|��&1���+���\[��Ind�9B#J��D�|�3�8P��KH�(�Q�)(0u�T��r��*�����ZvI��LY�k�G\>��>���-(�fr��5�.,�W3���%Jb"�SQy�1Ȣ�%��7����X�}g�p˸�}�&8ŵj�~�;�{oN5$�����N�Q+�EZ��T�l"\�MQ�3r������<q�l%�5*w<j.- }wF�\���O'&2�KR�0���p	��X�����+��)e�V���U/��B5#��)��*��V6���ݚ�؉�%ђ<�e�6�� �-ڨ��� ��=�T�x��&K#�e��k0���͒z&^��]��~L��r�o��K��܊܄��t'8������3��E�S�X���^'="��}K-Zɡ1-����Qh1#�G�$?J,?dƈ3n���Y��Ǟ��'��
y�u�fj$�����#:3�#�EȫQ.�g�2!9� ��3���8^��-Z+o4hs}�Y���Fm�\�a� �4֚�AGC�H�k�f�ܜ��e�� ����z�Ҙa�����
u���zV�J-!�M��q)�a00=4�Zu�ќ�0�@�fW2��O ��vE�P�Y�.1��GB���[.����*s�p�j��l���F�^��Uk��g\��x���0#�	c��)4����~"�����JH���QGO���`Fl��O�alUA�)0�f�a	dR&=�ct�jY�D�Q��e��G�b͜�d|N���U8�>���	��	��e�>��d��^��'W��*�|�I�^iԛ��\<i�5/#���'�q���U<��'��x��V��jkչxҬlT_=�0ڼ
W��*||O�Gc�R�֟OG�k}���sԋ9!�d�+��[r��@�Vc���]'j]�9�:�V���bs�X�W�yo-�7>���S8��`���QK�lߧs�d��y]⽤Xrϔ/o�"Ϣ�VN���CQ��s/4�L|?��/є�a�%�n#��W �of��.����Q?�w��7��N)>w[�ӟ.��|��¡4�p�[�����&��Sk$"�aƎ>|G� ����Cۺ���a���;:n������&wȯ���λǇm�����Q�����j[[���v�cpk��I���N�x{O ��8��5,h��>~hv�[;�{�V%��� PD�kHHg�^8nG�÷;�S�����{���qt��~�ct��L�j���v>��N�����St���m瓴��Q�\����a�����K$�ί�u/��0��}����Ɛ?�Լ����0�������������}H��V^D�H,|�׹��"F]ǣ�.����ŕP>
p���np)-N�,��r|�i�>Eǀ<����M���.�L���h���?q��C��LW���c+�}%���W���pw�}��}�s}�C��²�"V������R��zq�d(MPC�����#�uM��	3z�f����*!��-ik�Rg���2K Q?^B�g� t��]򈭸ڡo��z=�
Q���fK�$�MIĶ�'��c�P)-u��G)	�f�8m�|$C9���?�o]�Hz#H7}�=��cR��4w��G�x��d�(�� ߔ�N�L�y��N���	t�ٖQ��I��:Q��q!�=¯�Re��r7���$YN������Q 	�/f�M��fN�I�BbG��}�g�!������.�_�������g+��YLq/ޢg��"B�w��0O���JV��C�Lޢ��	*jz�T�b�.%v�� F����%[���-_i���⟀=w�4�S���}�p�sbI-H)I�>���٦$q��Fλn|VU�S�Y"]�iZ��$=l](=�\4AT=\4E��9�4-��3�4&N��������V����}�7T�z��(�[�^ ]{��q����Tڛ��]Br��8Os��\ﲓ=�����U��G��U��zɤOU������,�a^������Z�A��˹�4�t���0�$W������(�x%8�h�\
Y��>
d�qW��ǊSGZ�:�٦�Z'���M��Ȫ���G\M5�r*nm �ʊ�̒��:"�`C��2YǓ
�W�LK[j�f�KH�@[�5K��&���g�6�pa��.�rHZ�;OD�]A>`f`H~
��%�
iX��C(3m�;��Xë�z���q�t���x��6���D.���n�ш���n
��#�Ȁd��$�p��� os�U�F��ke%y $b�s���y��ۑ�9�r	�������/�����~��_>��_	�����I�"�:<�dH���T���O��?>�������W�����T���?>�۟~�'x����jѺ:�ш=?K$R\�Cu=,	��bi�������A�4�p��a��5J�L��:^��f#@ "!��ɊE�
3���D����Aα?4���k��7�o�
�]�@�/;��s���\���"��K��,ɻ:k%�^o���;3|�u\���{E�P$E��Gr���[���M�p*@w "��Wu�{!����^Q׈�(����MՑl�V:Mc��1%	���42�DγrV�rJF��\�� �L�.����ƚ����Rc)dw>�u�ߢ�u�&+w$��3Yd������(�c7��8�W=B�-��bم�g�W�
��Ro�/�f���Rؑ��������V2��>r���6��������G�C�_�L�L��	���qy+Ǜ�����˳�w�kO����)E�7�u�z������i��JP=��~0h!}��'$�~Y�@���X`��x�~r�o�\�i�D�D�C�\�WL�������%�M�IS�i<X�~�8m��B���<��@������>/�v7��Ct�y��,�9j,B�X��g㽶9����x\%w	�w���1��|�������`�6��2�"���/�c��fB�Ƹ}G�5��4>b�>��X<�9�z��0H�I �ɢ�@�f�� 5��C��HC_Ƒ1x0r�Ak�Z�I2�\K}(N�T��ѡ_^�{)������|O ;�<h$D�TCұ��p����hݘ��\M��8&&HP�,�V,p�8�������Z��%��s��x�d\�	G�*�l���0�m"�s:��J,�� ��n�J#��t0��@����e�Q n2ĥ�^��N�
"��V��/*Ӻ����!Z�x;����Y�9���}�:��77�A��1{�A�OQj�t9����_S����{���p�];�1���եw/����'5%@��c�O��xQ�ս֠B�\�Lg y���]br*�!���/U�dx�Ϙ����q��s������	����O��Sw�ѩ���a�`��%}����-��0v���Gjp��=�]A�s������r�+F2��`��?��D/.�7p~̬�9�l�;W������:{)�e ���`\W{�����pz��|��GqW)�/PЈ��S�
�y_l�Oaϣ�=a�xώ�)9ާ�,p��QCo�qK3�ZV�(����}��so��^�L��|��v��H7��zX��ϫ�-/Tz"]���b�˭�ަ0X`��K�h!�`���nr��Ǚ^[���_��K��L�N��@��@z+�����"��S���=;��瞏B=�+%ȃz��Jx�P����4���`A2I�F9'l|xx(WD0פ�p˵�
��g�Ð�.���T��1&�w-�bB�'Rz�4���52veŌC���e �����QO<OA�C�`Ҙh��E��$S��s��ܰ@;V��B�lO#4�(�"o,5*s�@��̗��z_��{��R�g�l���k$���¥���AH��F�H�F��u�����W��֎?�a�YV&n �ı�86��h�8v�6���@�ı���������P�՚��z�~�B��*���hu�G'?�	���{+b<���E<aOxH�~� "@d�4 "��~3���k ��qM@�x�<�A��I�Iȴu�j렴U������"�a�&6QE�鄢�'�V��C���įJ���;���^tw���0��m��� ]3�8�Y���+'�{�S��6�i/?��������r�E�96Q��eB+�.��ՒǱ��&��9��ξ4�h
Ņr8k�2(O0���LŇ���B�&�<Q�}��,�d �ic��|]�h��~"[у��M<&���9���2(t?��k/{�$�|qY~#��P\��uh�2(t������?A�qRޠe�+Z��r�K}~��*��c�-jkjyM�[�T^5����]�KX%34ҫ��3VZ��E�1��U
ߌ�w�5I|�d��6z��c���}��աPK��� ���CD4���e����;�;y�F����`�/ŏ;;�A��"��Y��Vm��b!��ƣ��b��ʈwU����L�}b��%�88�<}yRhXe1&?-�4<��,�	�����g��l�0	��ߌ��:��0N�!��M�L6��đF�O,+��\Oȓ�ϟ��0���4�����hN�3�@}�u-W�q���������Ŋ�C�6Dt��dT3a�%#��Qo[�n&��ҺqW�����mίN�]LF���3�Ûnw������ˋ���8"Hk���F��:�B�Xw��# ߽����c���APV�����[&��@�$�ݘE=Z�9��/H]�-��>O~��4u©��Db��������tN`�PXi�&�D�2	2�T�0�KQl��iaF��� �N1�s𪠨B^�5?�����?�?0�ZC�_U�͏Ӆ� �P�;<�7L����*�`��I	E�W�U�����z��ۇ@�h6K��Q����
D}���xE�R9]yP��66�h�H��!S�����k;�'���o��w���P��6�r�D(y�+;=;{5�*�PR��5�2tZ��q
j�C̝4�VT�k�=/��:�.����'t/�
K�ODGuN!��-s�VWBv���?��UU���F��k��\�0э�Á*�W�6�z�lAa���Hn�*�D�l�J��\�FSgwj2�o6�F���TY���b(����'�j�4뜏�f�Z�J���%�;d�1�J�ʀ��ɢ���܄�2�{���+�ak��v�iv��;qWǙ��F�-�&;.���'�t\�5m+�������ct!yHA�1xr��K��F���Y���la`�����_$l���C좎��������,P�����ǹ������e�Wa�������6V�M(I���f�o�h�qA���j�2�}ް4'}��\�H:f�41�FHV�K�r9|���{�$LT4��5��e~r�I1N<�b� �{91�!��U�5M}Ҽ�9���X��ݸ���������jR�3̘mL��-k�e�;��s��p@0������ �z���)[p�{���)t����]��R׭}m��+���~M0��9�ꙫ�_��iޑQ�i/��p���wf��e�-X�0�]yM"ҥ^����xT�� �WTJ�wu�V�c*&q��Uˡ�]�r�bW&Ӿ���o9�v٧  