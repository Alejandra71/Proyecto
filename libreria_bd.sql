PGDMP                      }            bd_libreria    17.4    17.2 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17029    bd_libreria    DATABASE     q   CREATE DATABASE bd_libreria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE bd_libreria;
                     postgres    false            �            1259    17030    calificaciones    TABLE     �  CREATE TABLE public.calificaciones (
    "id_calificación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "puntuación" smallint NOT NULL,
    comentario text,
    "fecha_calificación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "calificaciones_puntuación_check" CHECK ((("puntuación" >= 1) AND ("puntuación" <= 5)))
);
 "   DROP TABLE public.calificaciones;
       public         heap r       postgres    false            �            1259    17037 #   calificaciones_id_calificación_seq    SEQUENCE     �   CREATE SEQUENCE public."calificaciones_id_calificación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."calificaciones_id_calificación_seq";
       public               postgres    false    217            �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."calificaciones_id_calificación_seq" OWNED BY public.calificaciones."id_calificación";
          public               postgres    false    218            �            1259    17038    interacciones    TABLE       CREATE TABLE public.interacciones (
    "id_interacción" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "tipo_interacción" character varying(50),
    "fecha_interacción" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.interacciones;
       public         heap r       postgres    false            �            1259    17042 !   interacciones_id_interacción_seq    SEQUENCE     �   CREATE SEQUENCE public."interacciones_id_interacción_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."interacciones_id_interacción_seq";
       public               postgres    false    219            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."interacciones_id_interacción_seq" OWNED BY public.interacciones."id_interacción";
          public               postgres    false    220            �            1259    17043    libros    TABLE     -  CREATE TABLE public.libros (
    id_libro integer NOT NULL,
    "título" character varying(200) NOT NULL,
    autor character varying(100) NOT NULL,
    "género" character varying(50),
    "año_publicación" integer,
    "descripción" text,
    "puntuación_promedio" numeric(3,2) DEFAULT 0.00
);
    DROP TABLE public.libros;
       public         heap r       postgres    false            �            1259    17049    libros_id_libro_seq    SEQUENCE     �   CREATE SEQUENCE public.libros_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.libros_id_libro_seq;
       public               postgres    false    221            �           0    0    libros_id_libro_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.libros_id_libro_seq OWNED BY public.libros.id_libro;
          public               postgres    false    222            �            1259    17050    recomendaciones    TABLE       CREATE TABLE public.recomendaciones (
    "id_recomendación" integer NOT NULL,
    id_usuario integer NOT NULL,
    id_libro integer NOT NULL,
    "razón_recomendación" text,
    "fecha_recomendación" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.recomendaciones;
       public         heap r       postgres    false            �            1259    17056 %   recomendaciones_id_recomendación_seq    SEQUENCE     �   CREATE SEQUENCE public."recomendaciones_id_recomendación_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."recomendaciones_id_recomendación_seq";
       public               postgres    false    223            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."recomendaciones_id_recomendación_seq" OWNED BY public.recomendaciones."id_recomendación";
          public               postgres    false    224            �            1259    17057    usuario    TABLE       CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    correo character varying(150) NOT NULL,
    "contraseña" character varying NOT NULL,
    genero_uno character varying NOT NULL,
    genero_dos character varying
);
    DROP TABLE public.usuario;
       public         heap r       postgres    false            �            1259    17062    usuario_id_usuario_seq    SEQUENCE     �   ALTER TABLE public.usuario ALTER COLUMN id_usuario ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 500
    CACHE 1
);
            public               postgres    false    225            5           2604    17063    calificaciones id_calificación    DEFAULT     �   ALTER TABLE ONLY public.calificaciones ALTER COLUMN "id_calificación" SET DEFAULT nextval('public."calificaciones_id_calificación_seq"'::regclass);
 P   ALTER TABLE public.calificaciones ALTER COLUMN "id_calificación" DROP DEFAULT;
       public               postgres    false    218    217            7           2604    17064    interacciones id_interacción    DEFAULT     �   ALTER TABLE ONLY public.interacciones ALTER COLUMN "id_interacción" SET DEFAULT nextval('public."interacciones_id_interacción_seq"'::regclass);
 N   ALTER TABLE public.interacciones ALTER COLUMN "id_interacción" DROP DEFAULT;
       public               postgres    false    220    219            9           2604    17065    libros id_libro    DEFAULT     r   ALTER TABLE ONLY public.libros ALTER COLUMN id_libro SET DEFAULT nextval('public.libros_id_libro_seq'::regclass);
 >   ALTER TABLE public.libros ALTER COLUMN id_libro DROP DEFAULT;
       public               postgres    false    222    221            ;           2604    17066 !   recomendaciones id_recomendación    DEFAULT     �   ALTER TABLE ONLY public.recomendaciones ALTER COLUMN "id_recomendación" SET DEFAULT nextval('public."recomendaciones_id_recomendación_seq"'::regclass);
 R   ALTER TABLE public.recomendaciones ALTER COLUMN "id_recomendación" DROP DEFAULT;
       public               postgres    false    224    223            �          0    17030    calificaciones 
   TABLE DATA           �   COPY public.calificaciones ("id_calificación", id_usuario, id_libro, "puntuación", comentario, "fecha_calificación") FROM stdin;
    public               postgres    false    217   �9       �          0    17038    interacciones 
   TABLE DATA           {   COPY public.interacciones ("id_interacción", id_usuario, id_libro, "tipo_interacción", "fecha_interacción") FROM stdin;
    public               postgres    false    219   �9       �          0    17043    libros 
   TABLE DATA           �   COPY public.libros (id_libro, "título", autor, "género", "año_publicación", "descripción", "puntuación_promedio") FROM stdin;
    public               postgres    false    221   �9       �          0    17050    recomendaciones 
   TABLE DATA           �   COPY public.recomendaciones ("id_recomendación", id_usuario, id_libro, "razón_recomendación", "fecha_recomendación") FROM stdin;
    public               postgres    false    223   :K       �          0    17057    usuario 
   TABLE DATA           l   COPY public.usuario (id_usuario, nombre_usuario, correo, "contraseña", genero_uno, genero_dos) FROM stdin;
    public               postgres    false    225   WK       �           0    0 #   calificaciones_id_calificación_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."calificaciones_id_calificación_seq"', 1, false);
          public               postgres    false    218            �           0    0 !   interacciones_id_interacción_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."interacciones_id_interacción_seq"', 1, false);
          public               postgres    false    220            �           0    0    libros_id_libro_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.libros_id_libro_seq', 1, false);
          public               postgres    false    222            �           0    0 %   recomendaciones_id_recomendación_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."recomendaciones_id_recomendación_seq"', 1, false);
          public               postgres    false    224            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, false);
          public               postgres    false    226            ?           2606    17068 "   calificaciones calificaciones_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY ("id_calificación");
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public                 postgres    false    217            A           2606    17070     interacciones interacciones_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_pkey PRIMARY KEY ("id_interacción");
 J   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_pkey;
       public                 postgres    false    219            C           2606    17072    libros libros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libro);
 <   ALTER TABLE ONLY public.libros DROP CONSTRAINT libros_pkey;
       public                 postgres    false    221            E           2606    17074 $   recomendaciones recomendaciones_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY ("id_recomendación");
 N   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_pkey;
       public                 postgres    false    223            G           2606    17076    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 postgres    false    225            H           2606    17077 +   calificaciones calificaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_libro_fkey;
       public               postgres    false    217    4675    221            I           2606    17082 )   calificaciones calificaciones_id_usu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_id_usu_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 S   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_id_usu_fkey;
       public               postgres    false    225    4679    217            J           2606    17087 )   interacciones interacciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_libro_fkey;
       public               postgres    false    4675    219    221            K           2606    17092 '   interacciones interacciones_id_usu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interacciones
    ADD CONSTRAINT interacciones_id_usu_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 Q   ALTER TABLE ONLY public.interacciones DROP CONSTRAINT interacciones_id_usu_fkey;
       public               postgres    false    4679    225    219            L           2606    17097 -   recomendaciones recomendaciones_id_libro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(id_libro) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_libro_fkey;
       public               postgres    false    4675    221    223            M           2606    17102 /   recomendaciones recomendaciones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) NOT VALID;
 Y   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_usuario_fkey;
       public               postgres    false    4679    223    225            �      x������ � �      �      x������ � �      �      x��ZMs�=��٪DE�?�&K���*���C.�HB�`@�:��Wʇ-�re��uc0Cڒ���]���ݯ_��a?;��Qu��6F�R\/��+%��>8�P��Y�dgF���[�������t����ߵ��	#E���3>��,�:�z�޳��ʖʊ�x�V���٣�8;�^�l�q��B��u����˹�Ua�2��F�^�e�q�o����~[�Jf����͍򝑿����~�B�I[(��:A��$��#��ٕڈ���O�6�>V���q���:�)��UU;%��Fz��J�n�e����WyP�`��(;+��
�ؗ�)\�r�SMȗ�Ω�$�YM6u�ֺ�3��2�.d>S�����D\f:���J���Y4��V��ÿN�� hJ�^cl$�Wz؃~�LP@(���g�����Ț�C��~�����?�6v��Iv�s�0�c��6�y�<#��,�b���م*�pd���]wЏ�nC�˙��m:c]&Z���#�v#+�1�?�O��F�M��z �;�H���\gk����F"ѡH���uP�?9t���K�� ����6�x��"8�ᎋp#��6�%�3��+Q2�[����
tA�����*�����4�NU�&{T��s���H(Wޥ\����م5z���3G�*I�~�5%�r��������-QeHW�L���	cy<��f�q�l�rm���3��<x�0�$W�.d�S��ҦRA��\K��+�I�~��R$� (ngqH �W���l9ѵU��J�k�)ǥ�-�p~�A��7���g�A�P�N<f��>w����a������j\�'���x��T�����f�#U*�.��m���a��c	$ ��~E�s�ѠTq�RҩS
t��
�aW_w�í�܊B����\+�"���B҅cuWa|;���KK{��� \�ȸB^���SHb)�0�<�S�t�I��!Ȟ吁�T��R�ɦ�N>����1�������4̬�-�07�Q>�!x&���t��Q�k-o$
�����,*������:�r�ֆ�%a�� Ŏ0�%;�g`�qw��-l�]KƝU~�꺵p4����B�BE$�⣂�PE�6��f4LQ��P��؋�"J���2l�T���\UNߊW(�*����\L���V���Q��v��(�tz����a��V>��HP �P15��C���@��('LR.vQ�^�#��*����w�ʟB�������.���2��K����p����@���\�mὑt�]g/��7F�j�Qk��pNz٥���_�\�9��Z�OIw��ɩ��y�Ccs(p�
���DLz��n�
��m�q��.쓷q��`Vȉr^/Aeqc���$r�
�l
<��Gt�R͎���;*E��@��_Z;�	w^��K�>G��M>.%Za
��p���H���I ��s R+�������/���8��%�	K�M'^H �n���m���k��8�U.�VPn��N	Y��W7'8GyJX��e���U�Vh�,|�����&U����O��h��3��g�)n�M@���e�"�D�,����bH��Y43�	o=��bk�g`<f���o5�Q�z�8��t>����X�!L��읬�����\~���Uj��Q��.�-�wV*l�Z�C�5�N!�
qbW %Z�)bj �S����f�R����^�4wWLXD�LGD�̑��#�Ӽ�$N��G�h>W`�;I�.�������t>i@@e!�6�KdT��_����@�}7�
��nέ?�+Jth+nO$���] �����X�<n���a�[���e�;�ٓ-�_��a����p�5�~��>����>������̅�t�9���b�ɔ�� �$C���H��W��@}�>��@ז$����+�b�HvF����FN������t�ԙVHTU�����'4�Zn���1�p�ˆ�+��	W�U�K'��?i��C/{�9�Y@{<�0T�H󂿕hR�m�H#��6�ȫ���صJ�����qe?H�=�S"�&!�6�Ŷ0���0A��FT�2r77�H$@��8���1��&���\*��")��!gh�E�7����cP,�,Piv�Aø��`�/�:����`�4�8�5z��w�^�+����Q*�nڡ�5����Al:A�4�lZ�x�����'�eSbmMP.��<(��Ke�B	���og:ʞǱ��G�va�F��uG:ѩ���u�; D[%�o@��?�
 ��[�^b�؅$F��^�S	�݌��Ty-�T��+�!e
i�f��iZXvE�Y��1��M~ hQ7��i�6�QM2��^ Aq��^y)sq�_�ى�&�"��oQf<x@᪒&�� L�*�O�ߚ�BC(rn!��K^w 9:�N�H�[q�s�� ���J�8h�EF��Mځ�*��&Iۻdj��S(����y[=dq�4r�U���< �H�&:�~��c�h`��}BC{��!�QsP)���k;���G[.�9��j:�!|6j�����Z�A�^�!�I�p�$!����xY��
L<D>�$�AŶ{��x�K4�-�10мU��R�/�Lw���I욹��h�����;�08�N8�Z7B��̚$#Ms�[���dj�][�6�Hή��\���d#���L��6��R�I¯�X��ׄ�֧)��g���������nT>��>�A�R�,L���L7i�i�	�hSQѨ���M����S��3֋�*��N�|I����H���Z�c�@�#3]��ڢ WЄ%�u�m5!�ӉU���0����/[ކ(�r��xو�%)�Mg�OiG�)Z�ωZr�aJۭ��8f9�?&��
oQQ+C�����{C;����q�SG,tm�ɚ`elZX��٫��c&�8���Y�t��U#�FVA�L�@�I��#Vn��;��$��A���Vu��n�R�5��Xy��l�Y�l��L21��g����,�������ND"N��ԅ ��Yu3F i�62��I���`��}	u-�;9�;��-�����{_�.GA&ZD���TN�b�3B[������EoI�C�ﺔ>�6T�˗�9��/#��WTj�d��������X�;'�H�$�2���`g�F�1j���#.:�FK}.�w�`X��#7�$J��1A_Q����j���<�-Iݑ�/kO�>��a���)����R9"?f0N�^-HK��YW����4�C�*?�k��v93*���is������vo�m�s{�a��F���V�����9�+�p�뜨�34�Ȝ�+aE��:R*�@�����;�;�~���v��14ҹ �\�`��ǸW��^�;~ÿjf��2n��WSq �]�Ⱨ�7�]�*�h�y� '��z'���O�O �o,�M˝�!�ȷ]V�S;�>��y�BA��Z����[���7��O.�/�ۿ��n���i�&������{q�ցw�ޘ\�l�茒�[��]ߚ��c��� Cj�ݫ�4zd/0�;����+w5=l�}�&m��Z:���~��'
���P+�>�.���D�dI	��.�~��R5.H)�L7�Yѕ��p�r1���Y��$����ߦ=D��>�x��n̞���O��Rp�u�����9�X@=���lM�cE�Q�ԊJ�f3�YGU��^�96�qZ�M�t�
4g/%�p��l����x'��4m�萜;|��	���5����� ��S;*eקѤ���9ڔ���ja�t <sۖ�q�t�ks������`.��ͫ�l�Z�D�H^L�'�n�9����r���Ynw�3�1�wK�����@ѫ,�L�	r!�f<kJ�g���Y\�;�'a7���� [�����9�!$��r�_�~a�0�C�Қ�v/1�_�1��m?�p�ߌh���WS��zm�;�E�+�jg�G��n�&]�'9��؈��"I_j�u˝��C��)�Vqҏ+�����<�t�=	�uZ�75�Sg:���Qs�� B,Ŀ�E��=�M�� c  N��p:xr��5r9�)���N�_2`�������,��'K\�L�m�#ʨ���ן�-����/��SX�n��@�����:e���*�H�P�@�Dn�p���֞�)�ĸ�)R̭�ߜ��C�ΧL��K�_tl6qH�7��RR�f��NBѵ<��C��C�E�s(9j�}#����� ��~(�Q:;���ى�rq���I.7����8o�Y<��vl�85PÄ���e%I�NN��^AA���c���@��n�nY��"�	��t���a'�LM�^�roG���;�}w0�R�����e��s��!�z��F�+^��^������e+J�"�R�&�q�)�عc 5v�~��ٳ�D�      �      x������ � �      �      x������ � �     