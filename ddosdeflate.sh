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
��!ZSddosdeflate.sh �Vmo�6�,���4	[R�b�m��-��l�K���I���E��wԛ%�F�a�_��{y�;�I�Y1����h��7ӡ��w���vK���ٛ��UB�2!5u���UB�`1�J`
����w8=g����`�6|~:�� >4L��R
9�O"�u�4�hq� �s�F}*�,ӗ��4P�\��0�t���ꀯ3�T��4x$f���H�I�u���<��nT�c<��X(�h�����&!aLS��%����b4�m$ӚrXm>�@��m��`�bE���x�3�k;ĸ�~6�X�W9�)�V�=�bm���CH�Ά���le>�X;��\�H��eĤz�m�� !�#��������*%8/O}HX� �)&8D���M�ۘ6�uB1TӹAX�D����F���1A%��� <���4�T�&�R��fZ�Ƴ��S\��7��t�v���H"�<���Eg��P�ac��>-�r][����e.lk��*ehj�uO�2Ly~A��Ě��_���'�Ni�����ʑ1��+���ˍ�D��1�+�{��k���	���i�B�j�Rv��I�o�v|&�R�-<�m��2�!RUz�ul0`$J�+-�B�0�!E��W�xg&'���0o:'d/��*I:��0U��M6xM�y�S�՞�+9��(��y�쁙��k�������`_�j�Ԯ+57���ŗ�8:�Ak�R��Gp�j<Ƃ����װ{cʪ���u7�D�A&�#�j(3�t�b�p�����J����#DE�38S�d���,��������t2��W�U\�?��0/���-����������w���[������?#뾴Y\W���H���ۓޭ�)�uTҚ����V�U�F������c�o���_/ ��V�� ܡ6��t��XY֙�S�G��\����Q?����L��o�1��	�t��
  