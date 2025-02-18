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
��I�Svpn_centos6.sh �V�O�F~��s�H9�'!�@P��Z����k�	6�M�������E����N�8(qOJf����l޿K�B&cjsB&sɜP����ח�I�Y� ��T�T��f!��)	޳��T����B[�s���5P���K��i^��Zp��P�t�!$��q�-DѤ����n�n����v�+�j%H�v ������g�"3��;���1Sr�Z�}԰��q.i����^TM���9}�$UUŅ���HQ&ˏ�B�$��6�ǽ8=���4��S�F�oe�q#y�<�Zs����h���w��j�1���$/Fq��)4�}q�1�o���`�Q*�C!ƚQ��N�اOP��Q�:�`Z(���i	���PL�X�FZ��a_�֠�֭6���Ư_�i�A��꒠�I�A��!0H{���L�mK�M$w�Ћ!�{�(SQ�5�p7O���0,.�E�����/BCz܏�Q<���^�%�o��[�~�?��~f����k#u��?[6��v��>hj�٣�\Z[���j^E>�a����9�;�0�o$�'�6�$�Ҹ��_ݴγ׿��m�,�:���,i�2�oD�g϶��K�C����ˋ;Ud��0�b�k%� ���p]��e椻E�}?��]�9��N ����fн�9;K���A'}�>�C�h-Dگa��� �\�~{��E�E��hD�Ջ��rK����*��FɶxYT������6�%t)l��z�@���������c6G}���xX}+����UGC|*^Z�%�
ÿ�\���̿��WsGN��ɪ����>��{!5v���t�1N�u�۸&�-X#l�����e=�m��I���^�\0��ʷ	*�S��O˨qA��17q�B��'�����Z;�})ד����� ��C�'��78���I���_7�P�p�"/�x K�R�\��!�G��RF�:�==�	  