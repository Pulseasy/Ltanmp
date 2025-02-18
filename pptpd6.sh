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
�<!ZSpptpd6.sh �T�j�0��S��@`��8M�QH!ll�biI��b�D��ċ-	Iq]�}��f�ڕa������ݦ���.%��x��Ӑ�x~�KJ�|�V����&׷���O��P�?'~��|M>[����"��2�U�l�V�����E(�X��Rz��7�Qd���0�7V�TۥdJ�h�)"W��k��n�����i��|��UdfMAHp���T��s|-�gwFp�CK!�89A��V{�%<�&�0��0��f����!Yki��硕y�zx!'�m�«E�b�t�(�e5	��w�H�҈q��X-"�sQ�uf�~8�a[n���z9JWW�![�r-x���/�?���� ��x��,��=Z�]�,/��{�w�ťp4Q�X�MnC��c��s~��_�Ý.��ʹ���;�䠿 Y��h�C;o�h�����T���1I3�d,�j�Ҿ��x�4�XqC�VzG��+����j�����?1�f��4�_},���Q�~ai�A'kO{�i Z��.X7<q'�&�K.A�^���5:��p��fʣ?tG��j��jp;�r���7_�ӊ!=-\�������B�������Z7�Z��y� A�� �{���כ1^�Q�29�.�y��&���Nk���V!��d��
Mݛ  