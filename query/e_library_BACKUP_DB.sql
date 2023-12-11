PGDMP                         {         	   e_library    15.4    15.4 b    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18053 	   e_library    DATABASE     k   CREATE DATABASE e_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE e_library;
                postgres    false            �            1259    18055    authors    TABLE     j   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    18054    authors_author_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.authors_author_id_seq;
       public          postgres    false    215            �           0    0    authors_author_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;
          public          postgres    false    214            �            1259    18115    book_authors    TABLE     c   CREATE TABLE public.book_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);
     DROP TABLE public.book_authors;
       public         heap    postgres    false            �            1259    18128    book_genres    TABLE     a   CREATE TABLE public.book_genres (
    genre_id integer NOT NULL,
    book_id integer NOT NULL
);
    DROP TABLE public.book_genres;
       public         heap    postgres    false            �            1259    18100    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(225) NOT NULL,
    isbn character varying(100),
    synopsis text,
    publisher_id integer,
    year smallint
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    18099    books_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          postgres    false    225            �           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
          public          postgres    false    224            �            1259    18177    borrows    TABLE     �  CREATE TABLE public.borrows (
    borrow_id integer NOT NULL,
    user_id integer NOT NULL,
    lib_book_id integer NOT NULL,
    taken_time timestamp without time zone NOT NULL,
    due_time timestamp without time zone NOT NULL,
    return_time timestamp without time zone,
    CONSTRAINT check_due_time CHECK ((due_time = (taken_time + '14 days'::interval))),
    CONSTRAINT check_return_time CHECK (((return_time IS NULL) OR (return_time >= taken_time)))
);
    DROP TABLE public.borrows;
       public         heap    postgres    false            �            1259    18176    borrows_borrow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrows_borrow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.borrows_borrow_id_seq;
       public          postgres    false    233            �           0    0    borrows_borrow_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.borrows_borrow_id_seq OWNED BY public.borrows.borrow_id;
          public          postgres    false    232            �            1259    18064    genres    TABLE     h   CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    genre character varying(50) NOT NULL
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    18063    genres_genre_id_seq    SEQUENCE     �   CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.genres_genre_id_seq;
       public          postgres    false    217            �           0    0    genres_genre_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;
          public          postgres    false    216            �            1259    18196    hold    TABLE     0  CREATE TABLE public.hold (
    hold_id integer NOT NULL,
    user_id integer NOT NULL,
    lib_book_id integer NOT NULL,
    hold_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    CONSTRAINT check_end_time CHECK (((end_time IS NULL) OR (end_time >= hold_time)))
);
    DROP TABLE public.hold;
       public         heap    postgres    false            �            1259    18195    hold_hold_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hold_hold_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.hold_hold_id_seq;
       public          postgres    false    235            �           0    0    hold_hold_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.hold_hold_id_seq OWNED BY public.hold.hold_id;
          public          postgres    false    234            �            1259    18082 	   libraries    TABLE     i   CREATE TABLE public.libraries (
    lib_id integer NOT NULL,
    name character varying(225) NOT NULL
);
    DROP TABLE public.libraries;
       public         heap    postgres    false            �            1259    18081    libraries_lib_id_seq    SEQUENCE     �   CREATE SEQUENCE public.libraries_lib_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.libraries_lib_id_seq;
       public          postgres    false    221            �           0    0    libraries_lib_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.libraries_lib_id_seq OWNED BY public.libraries.lib_id;
          public          postgres    false    220            �            1259    18142    library_books    TABLE     �   CREATE TABLE public.library_books (
    lib_book_id integer NOT NULL,
    lib_id integer NOT NULL,
    book_id integer NOT NULL,
    availability integer NOT NULL,
    CONSTRAINT c_availability CHECK ((availability >= 0))
);
 !   DROP TABLE public.library_books;
       public         heap    postgres    false            �            1259    18141    library_books_lib_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.library_books_lib_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.library_books_lib_book_id_seq;
       public          postgres    false    229            �           0    0    library_books_lib_book_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.library_books_lib_book_id_seq OWNED BY public.library_books.lib_book_id;
          public          postgres    false    228            �            1259    18073 
   publishers    TABLE     p   CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    name character varying(225) NOT NULL
);
    DROP TABLE public.publishers;
       public         heap    postgres    false            �            1259    18072    publishers_publisher_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publishers_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.publishers_publisher_id_seq;
       public          postgres    false    219            �           0    0    publishers_publisher_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.publishers_publisher_id_seq OWNED BY public.publishers.publisher_id;
          public          postgres    false    218            �            1259    18160    reviews    TABLE     �   CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    rating smallint NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    18159    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    231            �           0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    230            �            1259    18091    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    18090    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    223            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    222            �           2604    18058    authors author_id    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN author_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    18103    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    18180    borrows borrow_id    DEFAULT     v   ALTER TABLE ONLY public.borrows ALTER COLUMN borrow_id SET DEFAULT nextval('public.borrows_borrow_id_seq'::regclass);
 @   ALTER TABLE public.borrows ALTER COLUMN borrow_id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    18067    genres genre_id    DEFAULT     r   ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);
 >   ALTER TABLE public.genres ALTER COLUMN genre_id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    18199    hold hold_id    DEFAULT     l   ALTER TABLE ONLY public.hold ALTER COLUMN hold_id SET DEFAULT nextval('public.hold_hold_id_seq'::regclass);
 ;   ALTER TABLE public.hold ALTER COLUMN hold_id DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    18085    libraries lib_id    DEFAULT     t   ALTER TABLE ONLY public.libraries ALTER COLUMN lib_id SET DEFAULT nextval('public.libraries_lib_id_seq'::regclass);
 ?   ALTER TABLE public.libraries ALTER COLUMN lib_id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    18145    library_books lib_book_id    DEFAULT     �   ALTER TABLE ONLY public.library_books ALTER COLUMN lib_book_id SET DEFAULT nextval('public.library_books_lib_book_id_seq'::regclass);
 H   ALTER TABLE public.library_books ALTER COLUMN lib_book_id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    18076    publishers publisher_id    DEFAULT     �   ALTER TABLE ONLY public.publishers ALTER COLUMN publisher_id SET DEFAULT nextval('public.publishers_publisher_id_seq'::regclass);
 F   ALTER TABLE public.publishers ALTER COLUMN publisher_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    18163    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    18094    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    222    223    223            o          0    18055    authors 
   TABLE DATA           2   COPY public.authors (author_id, name) FROM stdin;
    public          postgres    false    215   �o       z          0    18115    book_authors 
   TABLE DATA           :   COPY public.book_authors (book_id, author_id) FROM stdin;
    public          postgres    false    226   �y       {          0    18128    book_genres 
   TABLE DATA           8   COPY public.book_genres (genre_id, book_id) FROM stdin;
    public          postgres    false    227   �~       y          0    18100    books 
   TABLE DATA           S   COPY public.books (book_id, title, isbn, synopsis, publisher_id, year) FROM stdin;
    public          postgres    false    225   ˔       �          0    18177    borrows 
   TABLE DATA           e   COPY public.borrows (borrow_id, user_id, lib_book_id, taken_time, due_time, return_time) FROM stdin;
    public          postgres    false    233   ao      q          0    18064    genres 
   TABLE DATA           1   COPY public.genres (genre_id, genre) FROM stdin;
    public          postgres    false    217   ��      �          0    18196    hold 
   TABLE DATA           R   COPY public.hold (hold_id, user_id, lib_book_id, hold_time, end_time) FROM stdin;
    public          postgres    false    235   l�      u          0    18082 	   libraries 
   TABLE DATA           1   COPY public.libraries (lib_id, name) FROM stdin;
    public          postgres    false    221         }          0    18142    library_books 
   TABLE DATA           S   COPY public.library_books (lib_book_id, lib_id, book_id, availability) FROM stdin;
    public          postgres    false    229   D      s          0    18073 
   publishers 
   TABLE DATA           8   COPY public.publishers (publisher_id, name) FROM stdin;
    public          postgres    false    219   ("                0    18160    reviews 
   TABLE DATA           F   COPY public.reviews (review_id, book_id, user_id, rating) FROM stdin;
    public          postgres    false    231   �(      w          0    18091    users 
   TABLE DATA           C   COPY public.users (user_id, name, email, phone_number) FROM stdin;
    public          postgres    false    223   �3      �           0    0    authors_author_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);
          public          postgres    false    214            �           0    0    books_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.books_book_id_seq', 1, false);
          public          postgres    false    224            �           0    0    borrows_borrow_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.borrows_borrow_id_seq', 1, false);
          public          postgres    false    232            �           0    0    genres_genre_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.genres_genre_id_seq', 1, false);
          public          postgres    false    216            �           0    0    hold_hold_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.hold_hold_id_seq', 1, false);
          public          postgres    false    234            �           0    0    libraries_lib_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.libraries_lib_id_seq', 1, false);
          public          postgres    false    220            �           0    0    library_books_lib_book_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.library_books_lib_book_id_seq', 1, false);
          public          postgres    false    228            �           0    0    publishers_publisher_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.publishers_publisher_id_seq', 1, false);
          public          postgres    false    218            �           0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    222            �           2606    18060    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    215            �           2606    18107    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    225            �           2606    18184    borrows borrows_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT borrows_pkey PRIMARY KEY (borrow_id);
 >   ALTER TABLE ONLY public.borrows DROP CONSTRAINT borrows_pkey;
       public            postgres    false    233            �           2606    18069    genres genres_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    217            �           2606    18202    hold hold_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT hold_pkey PRIMARY KEY (hold_id);
 8   ALTER TABLE ONLY public.hold DROP CONSTRAINT hold_pkey;
       public            postgres    false    235            �           2606    18087    libraries libraries_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT libraries_pkey PRIMARY KEY (lib_id);
 B   ALTER TABLE ONLY public.libraries DROP CONSTRAINT libraries_pkey;
       public            postgres    false    221            �           2606    18148     library_books library_books_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT library_books_pkey PRIMARY KEY (lib_book_id);
 J   ALTER TABLE ONLY public.library_books DROP CONSTRAINT library_books_pkey;
       public            postgres    false    229            �           2606    18078    publishers publishers_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);
 D   ALTER TABLE ONLY public.publishers DROP CONSTRAINT publishers_pkey;
       public            postgres    false    219            �           2606    18165    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    231            �           2606    18062    authors u_author_name 
   CONSTRAINT     P   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT u_author_name UNIQUE (name);
 ?   ALTER TABLE ONLY public.authors DROP CONSTRAINT u_author_name;
       public            postgres    false    215            �           2606    18071    genres u_genre 
   CONSTRAINT     J   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT u_genre UNIQUE (genre);
 8   ALTER TABLE ONLY public.genres DROP CONSTRAINT u_genre;
       public            postgres    false    217            �           2606    18109    books u_isbn 
   CONSTRAINT     G   ALTER TABLE ONLY public.books
    ADD CONSTRAINT u_isbn UNIQUE (isbn);
 6   ALTER TABLE ONLY public.books DROP CONSTRAINT u_isbn;
       public            postgres    false    225            �           2606    18089    libraries u_libraries_name 
   CONSTRAINT     U   ALTER TABLE ONLY public.libraries
    ADD CONSTRAINT u_libraries_name UNIQUE (name);
 D   ALTER TABLE ONLY public.libraries DROP CONSTRAINT u_libraries_name;
       public            postgres    false    221            �           2606    18080    publishers u_publishers_name 
   CONSTRAINT     W   ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT u_publishers_name UNIQUE (name);
 F   ALTER TABLE ONLY public.publishers DROP CONSTRAINT u_publishers_name;
       public            postgres    false    219            �           2606    18098    users u_users 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT u_users UNIQUE (email, phone_number);
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT u_users;
       public            postgres    false    223    223            �           2606    18096    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    223            �           1259    18213    idx_book_title    INDEX     A   CREATE INDEX idx_book_title ON public.books USING btree (title);
 "   DROP INDEX public.idx_book_title;
       public            postgres    false    225            �           2606    18123    book_authors fk_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES public.authors(author_id);
 C   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_author_id;
       public          postgres    false    215    226    3507            �           2606    18118    book_authors fk_book_id    FK CONSTRAINT     {   ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 A   ALTER TABLE ONLY public.book_authors DROP CONSTRAINT fk_book_id;
       public          postgres    false    225    3527    226            �           2606    18136    book_genres fk_book_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 @   ALTER TABLE ONLY public.book_genres DROP CONSTRAINT fk_book_id;
       public          postgres    false    3527    227    225            �           2606    18154    library_books fk_bookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES public.books(book_id) ON DELETE RESTRICT;
 A   ALTER TABLE ONLY public.library_books DROP CONSTRAINT fk_bookid;
       public          postgres    false    3527    225    229            �           2606    18166    reviews fk_bookid    FK CONSTRAINT     u   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_bookid FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 ;   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_bookid;
       public          postgres    false    225    3527    231            �           2606    18131    book_genres fk_genre_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);
 A   ALTER TABLE ONLY public.book_genres DROP CONSTRAINT fk_genre_id;
       public          postgres    false    3511    227    217            �           2606    18190    borrows fk_libbookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES public.library_books(lib_book_id);
 >   ALTER TABLE ONLY public.borrows DROP CONSTRAINT fk_libbookid;
       public          postgres    false    3532    229    233            �           2606    18208    hold fk_libbookid    FK CONSTRAINT     �   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT fk_libbookid FOREIGN KEY (lib_book_id) REFERENCES public.library_books(lib_book_id);
 ;   ALTER TABLE ONLY public.hold DROP CONSTRAINT fk_libbookid;
       public          postgres    false    3532    235    229            �           2606    18149    library_books fk_libid    FK CONSTRAINT     �   ALTER TABLE ONLY public.library_books
    ADD CONSTRAINT fk_libid FOREIGN KEY (lib_id) REFERENCES public.libraries(lib_id) ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.library_books DROP CONSTRAINT fk_libid;
       public          postgres    false    221    229    3519            �           2606    18110    books fk_publisherid    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_publisherid FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id);
 >   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_publisherid;
       public          postgres    false    219    3515    225            �           2606    18171    reviews fk_userid    FK CONSTRAINT     u   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 ;   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_userid;
       public          postgres    false    231    3525    223            �           2606    18185    borrows fk_userid    FK CONSTRAINT     u   ALTER TABLE ONLY public.borrows
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 ;   ALTER TABLE ONLY public.borrows DROP CONSTRAINT fk_userid;
       public          postgres    false    233    223    3525            �           2606    18203    hold fk_userid    FK CONSTRAINT     r   ALTER TABLE ONLY public.hold
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 8   ALTER TABLE ONLY public.hold DROP CONSTRAINT fk_userid;
       public          postgres    false    235    223    3525            o   
  x�U��r����S`7��D꾔/c�ew{l��Le���D�@��m�L���b�()I��������\]��{���]���y��N�����E��z
K����������-z�)콫��H=�
~�o�)���l��F�/M]g�ͭ6��Z?��������F��ޚx�f��z}�O�,��o�n�'�乺2�������Ю7Y^�V5VϽ[o��e�@]G���&�r��M�om��!�Gj]���_���}����~=��d����߲|������ʰ[���G�ݖ���{K^�L��ب��Y�}E�����]K]
	�r�՝uÞ-��*�@"����d����d�/L,�uȊc�mE�Y1R����[.僱z�:}���к����hK�jiJ1U�;��^Q�b��{�5E�sc�'�K9���AN�qm�m��هPf���}˭` �e��Z
RWj�ɛ5�����lĮ��/B�e���W�m�o&`�җ��>L�\�W��l0S��݇~��;���Pq��Z��&��vBx�jc�:j^�۰��+N)�!!���W{��fá$�iD�=����T[�H�r(@�}69�h��o&FK0m*i�pF�~n"$�٨�������(W�RԂ �i)��F�ZP�J���C!��܎�v�֬�scV��q���ht��M�V�2�b�?�m6��g�#�7WQ�Pf����"Qh#w��|�"T�t���}�@K�|����.�'G9~\��VzFA�x�m� 0��Ó0,@u�8s*��r?[�֖6��
�z�1j`��$��-�je��և�d��.�%��4(M� ���_M�y��&T�z�� ��d��G�M�V���x2L�o\%����MP-���rY������U��V\6����ޓ$�6�LN]x	���'�L�3jRJ�)@��d� )��Եͦ}�}����!���h:�%���d�B�k�lc���S����K�Ct`�V����G�ɀ�h�e˧cu�!ޛ�5x�������:(2�
<i��5�fә�
��x�j �=�Έ;����3ˡ0%�d�|Z�G5��@Cf�O���B[��/���l)���F����XC������Y@������f�I��7����h�,�f�����7��r�y�l�ߗ���$�Ћh��	�����x�- ���F���\x�����m��u��ֳ8T�ԑ�n�YYF��e�(�׮6�Ѽ�0��~�j�?Y@ ���L?NO�g�\�l��AT�L�j��Q�D��K��@3�=?�_��G�����%�n��oƣ�9�׹ ����be.}Rp���;�-bA+�%�3�ۖ�h�l��{ԋ5��Ue��T!�-�G�z�F$Pf��5������b�Ŏ�s\��е����䐡z�2;t����6���J��0��`�/�"a�'���
!��Rƍ_�B����x��!G�X� Q�<�a���e��8$L�<����k�)�xoB��d�b��R�7�?�/k'�
kcuE-�E��1�V�{����,O�l�k '��*�OQr�ӏN���Q�k/���,4�ɖ��.�������}�ih�1�{� 	hdd�
>$�j���ó��+�p�*��G�tK�4��D*���3���i?�� Q<���s���Ҝ��ڑ�A����ý!.L�����Q���yP��,�Bq8l5��N�s|���_0a6��Qun��D�y����,Lռ]�"9V�w���X��
� tԜq?���KB�T��R�������
�a�D��)��X
[1�ko�G�ŲctJ�&2v�	c�׊6@0�D�T�-�1K� y��R���vUI�x니��RcL��E�B�ꃫ�Z��ć�� ue���L�q�B8�8L� (��ן 7�܍���#b�q�>���A߶&�㣝���t�L��;�hp�nZR�B�i��J,qMl�m������^r�t�ٍ�X��&�!��������9�a�"v[����l�աt%.�c�i`����߽c,fXme3@+�I�>0*A���TG?�k�`&�G ���>q�Ǩ;�r���V���hI"��_c��y�i0&��d6��J�	�M�M�K��X�8!�+�tv��b��b�a6�.�S���8�K��Oȼ�L�	��~'��4�w	n�\6�X�#=��q]y��el����e/�BJ��hV�x�%b�u)��/{w�Y��\7S��r̓�N�#{"�#�]`��L'C�U��E�cOhQ�V8�2(]�ԡ x��ܶ&��F�rAdrg���:5�b�WN�#oӕ== �S(���ѩ�L�}���(��#���5���������W�y�9e�[FL��A"�^T����ϘB���I�����l�''�H8�9x���	߱';����ʩ�⡢��r�j�Q���^�A���L�>zԴo��k�w���w����)�{�t�tD���2a����Kld�O��Y���sy��W�b�c���9����,�P�;      z   �  x�-�I�� ��a����.����H\�l��4a�i�e�m�Ӧ/[�m���׮ǰai�eQm��bz,��-�Ǳ8��z�w���D�V��ٖ�9-�sYN�m�<�����ǋ�^�^i5�Ȓ'mE�Ӫ��U{m��u��׵����x���N��]����{Z��e���zz��}����gX��g�>�f��B�s�,��&%;6��ks�6���y|���{}��������m��c+}][�{�j�ak�N[lB�ھ)��i��f���%������?�v�aZ?i�����Ӷy2m/?�6[ʾ?�~���w(�v�o�I�e�����N;�wٙ~��<g,=�vz0Z��J���h��2�]��.ČmdƱ3�
�_\�.�V@-!�w�0�]�2
a64���!҆ �7!�Q��6�""4H �Ȍ����܈��A`0���U��I 0�	�k %�^}��a� 1���hu<tH��wWoq-)�N�D���0C�M6"�&��Z=|���z�����`�9j4TL�1	��F��΀W�JD��
�՜K��$�p�ܲ|��c*�m5>Jt_lI�$Š-����^���L5��% �Kw�E{����O���[%XS5b?H��������=_& ��u{��Hb4x��^���V�"!X��D�h��w��;#1:?A�Z���^���)�c`O�䐘⑙��|�(�Q���)���u���8�O��Ys?ۙ2Y�O���$�i�T����K����ll�~l%�ʟ�=d	�9E>��2_�"��$��D��rȗ������ϖ�5�hIS��F	��G�׺)��b�W�--�}�_Z��t�����R��hab)���0,K��)�1��*����r=�H�����o3@��K�2��W�a��j#�?����K��MCWKя����/�я<�+i���B�j�) �_�������=�/����	��XY�+s]�1���y�F�!���v��ӟ����B��W�b�=�a��J����Imb��(��UR����^�����PKD+��G+��^��/�Ubl%�u+�gj�O� Ŝ$�d:i��r:1贡3�;o ��)A�u��U��t�Й�S�
=t�(i1���\�_�� �������p�      {      x�M�[�,��C�w5��}9�oǵ4�U�#Q�w`0�p�s�k?�9�g+�ɫ����W�Q��^��)y-�~��6~���[�z��~�ªx��[A��*�}V�{�oWX5-մ��R��J�֯�֟��V]��
T�v�[���w%���#+��*p~�����SAe�N��z�~�tU�UΫꞓ>��T��j ??U[�m��
��QU��*-��m�l��{	��T�y�z���
Օ��Ё��������kإ��#��?�*����A��-)T��4�P��ZV�A��(T���ϯ�y��f�f3
[�³�fڑ.+T*z蹎ǻ���8�UЗ�Ҋ�H�נB�D7�s�`��ϡ��9s�j�����N�UX����l5K;�34�r�pXã�z�o��mP��{T��(���Ke5�fH���T��ս�:+��������ȺU�ٖA�g7ԄQ�R�o��]�4��_�&%l��^kݫ��E���قA�*�n�uֽ�*
�3����j�*|
�T����ǹ
�?�w���U�h䕲�aA�laZ�(�����@&.�=:I�7?4�+��P���[��ɤ9�X���m':YyQ�@E�8^�[�J,��,IA���YT4�F�h^K
5R^���8�4	��A]�<�5=Xf�5)� >M�a�9�����C�(A�]�q��4�1�S�����hqAG��g�"���f��2�e*���?�Gk���f�BU�Lj�~�y��1l�S�X��n��,��	���o�9AY݂�ɪs�54����&VsZs
��xۭp)T�/��Z�ԃZwW��^G��5XP�²��"E�{]N��.�E��
�:.�bA�����Ʀ�~�C��M'�Z���ʊj�T��[���Vz�j�6wqHYҢ��F�����5]sY���l��hK\^^.�G�1\'�/ɰ��ۏ�9�l��	O���c.���L<���;]y��Bw�K�z �&�7����H�[����S*����9�v7�F�2�����*��bT��<�9�l�ҍ7[��Qss���7���χ�
��:jnk�Be�,�vc@��:�5%6Q:0N��mC����tcU�M�9�6��+p��Pa��	������nYP�*{l�6��:Nl�[��3�'���y�^����Z���N�͠\Os�B�}k��;,1KX�G�I���`@t�n�M�s��xET}��NwI4Y0v��@���"PnkOB�����s�ʇ%-�����4A-�o..
�+R�:�~�P�vʐ^��5>�:��A�Ǘ��xX���P#���d-�T5�$�}u|��:E��sXd5=�T�wƃv�G�܏�!�!��BM������-�m��k��u���nW�/Ǖ�������7ihخO,�ucx+�^��,����#I�aa^�_A�,�I]�2��&|K��V�ͪB�c��&�C����+P��U�6x9�^[��m��Fx��jYU��� h�Z���&�ei^������<�������#a�
V�c5>�1�G�
umT���y>L���_�z�������"A�rE4<r8TG|�x������?�3*Tw8�</�ǎWp��E;K�y>����{�Ӈ��Y��84���g=>k��g>������Ya��
���Xy������-?W{���ȹ�?͹�w��b���@]4?��r�/���K�!��7S�ln���L����_.������7�����#$�g��	���ao��0X�u����cF����G2͈�)��(�b]��P���=�>��?��~�H���ե���?�L�\�^*p�/�}��G�/�~N���ItN#�ji�h�pA�4h���B�4/g���qe1.R)�G$�2��h�f�n��Xe;5�蠅��XW<~)!��RBm����w�W��%���Ak���僓�֢OK���%�B}	��ֿ�P�!C$5s�aG���#B����\J�P`��ZK�VK�e|>�]��þ4U���i g$�\��O�g/��:�}�2t�^c�(�Dt�/��)ԩ�Cv�$�)�]h�kPf��iᑄ#ч�<�����<����F蚵1_�o��� <��ȇ���B,	oC��.�ד� �56�k� &��\QpӗK뗾�Jt����*��M:.�J�V^�L�������;B�*׋�B>�	Z@=״"6�)����2=���DBW�\̂�h�Ӊ���1�����6���1�pR-lT9ՠ�\T��2$O����J/��2+u�����%F`��C#�F���1n�C0n���X�'�1�Wʎ0��e&���j��Z�*�:X��M�D�H3���>���$Z�wr"�&�b����F7����Hs3Y�s���:=���Fב�a��'p��$�k��~L[��s��\03&烂ؐ;���K`ˠ9&������f,�Y�	��Ϡ�mk������K/1	3�@覄è�L�BGjwhF���1y�09%��j�X\�:	& Q�a��/s'���)�A�Y�[�_2��b��X��)R8���3�X�+� .̱i&��V������{�djL�'�6��O�IKL��ebĂE���^n��i��M�E���,���ں��?����026�}��g�;k0i�0>DWF��D�f�
,<D�]d�_n����b$v����6[�fSI6P�4V�����o�e��C���w�;V!욱��e�}X��V��iZ ��esM� m�ͱ~�h�M� =�ţ����0"�
<��t�Ѝ�l�y�~��.]˛Dx7C2���^^����6}#�=��B����P8 �n~�i.@��!D�q Δ�/n��˔�:Ut���*|���73��3x˭��rP�#�b܍P#]0�Ҋ�v��^�5Pâ�3D��ba�,v�!>���y���c���dо5y��L9���*h	G'\$>b]$���p�NL��1�p@8̂�Yp�^�òԒ��f�~3e\���pɣ���3���	wD��s��	� ��\ޜ�L�@�_�O��g�_����w���z�L�u��#�����8�]���4��@�=��N�����I�ntK9-\�cp��l76�f?�_�l������4��9�$�
(���1[�?���A����v����	�����5��X(�� p#j_��Bݟ��=lf��Q}���+�u�9*�����Ѕ�P���?�=
��cWx9.<���P� BJ�:��c4A��yؠ�b^l��e�]?w���k��f~dB�����85�g�f��/C�c뙅�i����O�S�O"�p#�ME�~����(��:�s��Ӱ/
�}H��D;	��5�������݋w��C�\3��78�V.й�^�;�����ǎFy�|Vj�ip3x���<��v��9ѡ�Y�q��*�*.B�ܵgH�h��n�2����$4�y����v*z��i�v��	g(���U�A��g�q���')������(�K��Q�8+���zܕ��x��6R&ږg0H{�����j1��&�ۙű�dR"[�pλ~��s��;mю7�l��V�b���2W`{D�{qR�&�@V���[��(p	��.�ik荭Ahg�G��&��_|7�$�A�� ��b�E#�*�u0c.�����ٿ�iݾ�=tb�?��6�h�#�d����uC�@���l�8�p�.�C4MC-v�E�7Ve0=F��5�@�3%z,�P�����֣�BY��Ú��ȭ���;ǁZQx�D�W9oJ��M"6�VP���M5�=���Z��y���~"���8�u��Zt��ad�qg��d:�G�(�RU&���<�`����kE_?�x �$�5��lx����	WDwz�_��o�5Ù�Ȯ0V���}(��88L�e�Y@�U:b��3v�4?|�t�;���`��Y��H&?N&����P�\�C1���L��22��+�o�� ��L�M'+~���4D�0�#p�hDg|�:Np�4�Q��� 4  �a��p��G��23	&ꝃ�|aH�J#I��9u��N_,j;��'�={���d'��f�-����$v���`��q�C$Ht���)0��n���*�Dt��	3���Ȃh�@��;��<������u<�.k�bV���*,���5XX��>��)�!�Pv�C��o�+p�_0\R��]���O4�<���j�Q�ɳ⮼2N�+���MA�5��}᨜u�����U�:3��@7�S3DFcK��n7z_��~�h_�_d���毛Ѿ�h_T�2��8�X4�X�a�t�؋$���#�f�r�(�w��q�a�x������Os�_T��
�67�@�<�Fisi؞4;>�"b3^D)I��b��ᓅ�C9'č�7�B7����N�CZZ$~�?�Q~��2�{S&�bsc(؊�Y`{�߇ǈ��̋�����p�F��a�=y�h�;��|� �D/�	4m����w>����'�.@%�P�=�a�-���؅�^����e~��Q�3���F��;`\�4(�i���.�T2�?�!Ot�M-���Z܉ָ��'�ɤH.	�?A}�q���k���p�3����t�@(�rQ(�����'�&��5@�q����"�w��*�˟p|E2��l������k���dR'�;<b�(<�R#G�Ŏa7G��$z;��Y�3a�c`Y(���B�[�T�L1���� �P�H�ΰ�hq�4�/3�r���`�ˠQG	ь�����е�R��L\�����+���Y�x
^��z������B=��l�r���J��`��`�s`�UP���r�{��_�|��8�=Ny����dH���(�{b��FE�4�t<�����R�͍"a��C��Dp�+�.��H/fI�{�k7�`���l��<DK=�:��Ů?��������:��a�߯���gO/�J������}@�!n��`����U򗙯��	:�5���-E��7B����WLr<��t�k�O�Z
�'�@=���P�>�6�3��])؀XJ�%D��|܄����Nt�?tOW�m�o��=_�6�*7��a���[��P�"�+t��4��>7}�V)؍~�������:���=F�y�	� !�j1|��&|_:��|ణ�2��?��$���7� ��Q�e����Y���r�.�,L���$�&X\G�>�طq���ޭdf�]�J�d!�}��S��Z�v3؍�T5��5>y���!k=5x��<<�M��2\��7�2k���C�	�-<��|�:�Yꈧ���>��||hf�/��pAH��e�S0�4���<#�3�,j�����̃ά�~s(p3�.��;6$�
 G�jFw~H���4�E�,}s��q)q5&\���@3z�3���������`��ND��czLC�8��u�J& ��'���ǬO��\��u��+��qeo������}Ηh@ϚO]�ߺ~?v�,ċ�v2/�5�^��5��p|E�؃�;��5ć��V���7��k�Ȗ0�E�)[���������      y      x���˒ٖ8��E�]�k���3 0i|F&��b�&��zr  ��p��G �Q��=�J�I��Z��M�k|�Y���Kz���9� ���JU� ���c?�^{�����ݪ���|��׵/���C�:y�*����O�Mr�괔��k�e���o�䍫}U'?>�S_%._˷�����Ϲ˫�/�2��5���F���шO~�V�?z������\'�}��=M���iU�	���>��+_�]~�-f���l8ͯ����|�,z-�qu���fɱh�u����+��£Oޕ�er[��m�g�d8�Ln����#�,Yy��\����#�r˕���eqإ����U��c
�d�>�Y�IfP�o�*|_&�yq�/{��p�<�n�N��)�}�Y��[�n�}en��ǦLn0��Ǣ�j��p�����l���;%�"9z�_��ޥ�����eG��kWʌ�+�ڼ�}����MV��]��+�m ӒV���z��W���ޗ�d�9�1R,��wU��L~ #=���d��ʼU�89���8\�e���"79���r_>��Z�2g��үˢ�c"p��MYe�T=I��Wɰ|�<��M!��<�UZ'�R~��,62��y���.dԻt_�ls����w��ӽlh��;��x���H���QVQ�M�K���_�Ņ�'Y7>�w�wɛB6�OE������z>��+�?���6i��ŲT6�nگ����p���crJ�� ���y���2���b3�ڵ7]{Ln]����'�����:�u2������u���K_7�lG���b{te��e��{��[��I�T�/2'r����J��S��'�n�=�T�IU;N��ñ(�u��|�l��ʍ���i��q���Բ����eoQs�hڻ���^�ջB�n"�!��T|L!
���xx5�����;�29����μ�뭗�ٔE�J��P�V;=��s�V�'n�V�-KY���7��[{�S��k��2�+لU��'{�ڹ|�m"�)9��k��E\�x$�~��e���r�{��@Y���_A.�'nY���L�\�=�pٛb�f��(�_d�Q93�+�5���XU����Rm�.�]/7,����p������c�N>+���=d1d�D
b����}V��n=�:�䊣�q��[�K�?���˾�cXbZsN�o����Z�T�r�����"���`�d	�a��r�49��<=�ڗ��	��?�ҍ�!p��B�2��?��#|�Ie��Le?��>��wa<~4M��e��{����(I�8"H��!��A�7�P�lx��/��/������w�3W�Ү�ߋ��\�U?J�l]�Pm�1�pO�9*�T���!M*j8���q�{O��U�ꖥ����`�,������~�D'$ˬ8R�P`sCx�]������Z��q��T䝼��L���'IiSY�  у
3#��vGŏ�.�s���έ�|Z;��9)ZQ\�j^V�7�q�gv���B`�/�g"��f�V�dt/�q���f��m��e+�f���s�TN[#����z8��4����ȉ�q��Wf,���J��E�{�er�Ř���nRXhq�V"ȊlY�2����˄�i�`�e�����&�[� ��t���x"�,�;�k��å}Y�j�`�5%�t�2۞;�`���2��+��8�s[�����⮺ǭ09M}�T7f�+`j�8��)��>`3�q;b��3�W�������q����r@L��!����n�'v��_�(n����9�_�WV;��P�\m�wUX�lB�Ux^&�T/��Z�*D�5yε
��^��r"e&��+=�e�x���֜X]J���W.֢~�Y��4b��i�\������\��C
�(��N&��������Su��D��dCІ��g��d2u�n6�B�x�.�d��{s�`�h���)��wrg�+�p�'Ȗ����j��m�,e�dҩ�徫����Ӽ������i��Ȋ���~�j�S-�qM���~���[l��\���8��R�o�/b5�j��c�d����D���D=}Xέq!\�@�p�O�� !Z� �u��^ԟZ�"gW����ԍ��fy�^^�a��*Y�^�w7?$����B��	��T6<���N�#��?������f��&]��[G��X���`�2�C8V����/� ^���h8����MA�c>-fb��z?n̖�iN��EX<�ՠ#R�羙Ϛ
ֈ)��C}q�Zv^�j2��r����@3��0�`\�QC��|%�|��ƆF Ù^���V�8@t����Q�v�Xn�`U���GP��<3��e�%mT�U���ϲ��h���+��R�M����Oɋ�ȼ��U�Zy����Z}�=�rl^�^�I�
��<�n�G{�pJ�2��ld�`Y����<r���t������N�5l����b{�g�&ޥYQ�A�g�qi892+�~rJ}�փfՌ
�n�E��šɜYW[�IJQ:m猳��j���"�p�/��EI�¶J^����s4'�aZ5�!��Kηأ'h}x�]8'0ME٥��f �"t�q�q�5������0�1~4T����*���q/�<��6���-=�o�Z�*辗bb������&�FD���|2Y��U`�(�{QGjj엍9"�D�Q�[��j��]<��|1�Gȍ���Z2�;F4��O�w�>a���6��3������a��x�������%�
��z�O��L���>-E�C2O�ж;�ox�"`p�sĥ.��c���O����?�|�b?��K^#�S�;�W˕+<v���"�9cA��� ��`E���r��E���-[I�`������w�(���6ǆS�T�X��d��l�Lz�Sq3E[�����P��ޏyr�l[W}1^'�~/�ɸ��F�p���T��b�-��R�uYh\��Y���
B�EVIl�b��-���Ϣ�s9�G��}���i7��| �����Mط�n��"Ȫ?�EY�U��؉�_A�r�4��m9qP���LU��i���7���c>ZZV�H��W��	�.��8�#��"M��3�1�?��{��|�h8�a�ى�� �ѫ��eNrĆsU~o��-e	]�p��,-JDF�/�Cn�S'�����ľx�:N�Y{�q΅���ۆQ�����KQC9�{�J�˟�w���y@��{��nt�r�'x�+1�zÉm9u�Ez˴ؖ�c��V�������ǁh��t<\��js���4}��{�F���u��l<[L&������}Pّ��q}w�C�׷��T��C�,?"�����K������J�l6��~��ߵϓ-�c�����/��_>�.��#�����ԡ�/¡���\��b�3���o���ސ���������[���0��/�:JH�G�kč)v- &[���F�1��ihR����:�R����DXq�JT�ҕKZf8��#*�t�{�II)���+s:Gy!^��#<F�A��r׺3js��E"��#�qs�K��?{v<�uqb�dj	����)�Z����g��hD��62��DN� k�s##��R�8�تX%Y��X��pG9j�0�(����^���_r�4�W�_
�.���ܽt�]Ek����½������&_�����ݨR�*J٪t�i��M�m�Ub�%��_�*��D���W�;,np[3����e��7+��J�/��-t����\�|�/�?D��`���.�e\?��+d�^Gtc.{���c�S��w�jk�C�6{����k%wa<�
4��"7E����Nǣ���bֻ�i�3�fW�v�y���2�Uѭ����y\���;��-���4��ݤ9o�:��#b�p&�7u��)7et�n;�s�,���/�.E4�^��,Ch�"5~��:������Pgy����\�јp��p����ے,���jW2�79�HhjQ�-��o�Jgܬ�� �ő�� � ֡|M�3x�K]nD�(��d.�[	��9鷇�)�4p<�W�Us��J�0l�~\��̖�=���Q�ɣ�wW#�]����L    �W��t��}�FJn+�V#�ܥG��G^g���p� ���ʯۻ�Ht�G{��x�������́i�����Iο��S�!&LF�����p0�uݧ���'���+��+�J��o�-�6���Ny�gSA��X�u͠Sog�A�I0y/VLˆ(92>"���pC5j���
2f�l�ҋLF�Ŕ�ف� �Í� (�|Y�R٬b����f��bB��\q_=���7��-�����}�T�A\l
~�k���$|�b�eɡYf*(/��FlB�z�0v�����6��<]&��Y�����J��[��R:)�o���d������х*��D�t�'C<\�?t.�
d�"}�"g�������gJ�5��ej�Rf���@ "H� ��8��L��b��Y7�z��M�1	�_$�fgd#b �3F9%CoK��a����'�@��?e%0(�i�=0� J�y�,�d�W���l9�A��L�"]�c{8|�Q���E��S��0��)�֫ap�$�.̱,�������t6,E-_�q!a��X�{D�;��Sk��h���o
��9ǈ�D�?�:_~���ܳx��JLc�I�r%�T��ć�%�L�n�K��D�y�!d'���kG_ܢ���]�Z���D%�q[�%�pLh���+Gi�0�<r�/�8�:��!0�ុ�j���>��p�#��
�4XDٖ�AC���$"(`�ӦG�����9�%/e��:���q�>��D���;���������fc���u*�k��|('�8�Ď(@9v>GV\��͓;�1)A(�NF�ލ�e�'/�H�����I�<y#"\=��V�ϗ�s�2ē^�U���1���j �Df˱�)��J�/�����A�LD���̭97�6ej;_8��]r��Amey|̭@~V<��fU��A�G�^D���V�
QR���z�� _�"�Ԛ�g�\[(��V؄�6��c�y�S;c:"��M�hXS������|kk�O��<���r�v�w�Y�"N.69�5dʪv���p0$�}�<����v���$������D4�S������Ո�FL������'ϑf�����Tm4k��zG��9J��tf�a3w=��6fP�}zv���L�k�W���f����RМI*Y5NK3�\V�ԭH$�CuP�9�Z��6��^9vN<���o����"@:��cMˮ>����ahLB�D����
�$���k#�H�.�-#@�Dh�	 ́���YV����4o�6�T��䊹��x�����!`�d_�H#,5�����D�k0�jx� b'��OnDͲFG.�l��noEԕ{�A�PŻ-�P�C�8]'y���=I����� �<y'*�dt#\�{#� ���ጛ��O��Ń�S��^΋C�J��N,$�+�4�(.�WɍxPr���^�[|019��^2�Ar��7N� QT���DD�Ｘ?ժI�K��|!*?��k��v��Q.��Q�no��_�3,E�`�O��X�f���Ѹ<��Ļ>�)M��d�Xh�P�(�B�u�
�)�]une�4� `�yܑh�I�N�qx�2��k�ů$&�W��l1�f
�"y�TVXC�#��K�m���ߕ"�E�kPƐ�C��I�3nx��b̚�r)F�]���4�J֑h4�(���pm�8�@�E�G��L��ٱy��3��rF�#,��Y�\�1�L��\#�c���jB��6�������2��O����	�����,��b�s(�{l���҇0f�[�3���0$"2)�B<��~�'��� ���ZB$�r�k�C_�Q|�.�&���՚���Wa�_�����3/\eb�4���C�j�2;�����-������	ǮٷI�Ѭ���M��fZ���Y&� ��HRl�5#���w��8�R����R�6
�KBWjU����8��gn1'�ALV�N TTWO^�d�����K������V蝬l����,xpaAQ ��^DP�[�r��1K��Ӕў�9�o�눘����a:9�HCB˦
n*`���=褔!���-Ll�q"y-�eM_%&�7�⸠�� n��>���qֆ�5��1�&��׷�z$=��ע8r�B�v"�-��y�&t*N2�ἵg�v�L3�=cۥG��������$�������������+0��G$��z��V
E��ꍈz-��w~/{�jf1�@m�'�f�bV^�u��
fY6]���0�GKg��κY�+RM6� �b�[A��6T�6s�ސ�i>�kգ�79Eȶm^�W]S�����!������ˠ!���s*�>h����,�Sh����`p1�\G���D�x�{ɠ�,��8YLq���x0��{�]��m�yZ�����)X��|,[�n�GY�h���k�T��>sΞ�J�(��n'`P�I�=��҂Qp7���+f>4�n�� <З�]k�F��iZ�J�����v ��]��,���� DX�5�Q�q2+����x��/VAZ)V�  �2B��$�-��KK}X{#9�e�˵A�����Up"�'�;����0q�Ww� �"�:�q,D�7�\�C�$?�ؚ�$�<��Z�ń?#p� ��`�h��{�<���p�N
�R�NQ#�Z�l^� ]yn����^)u!R��z�j�G�r������&b
1��M-+rh�>%��۝��ו��|�gE�엍�	�}G��P�Wږ��P�	d؃~�D�W"�ðg`�k%�[�i	�!��Թk�j��O�C��P܊��iRLG�'�:���b�^��Db^���H�7 hF������H��LӤdf��/Ӫm�Գb�-k�u�=M��KQ*GTQ�T !|����*�檼��(��J��Lf9f�e��ā8��t���A]����0dl�,�2�֤�hÒCba�C�Nm �}�=q����m� 0��`�����y����ٳ�1M�؆��Wel���� >��j��1De��h�w�T�$�+,��-�-�v�Uu�PŮ���i��7�5�F�Ef��z��R(z��ϋ��c"�)~�`l��Vt�
��eH\�d�6��D[�r�o�����b5��q�
���8;Y�>=�Fe1�W��7��W���v��+B�'�z4϶p2���a�IF��a�4�����Xj�_������ y&�������� m��"��9A�>��o����Y�z�P���f�6������Ab���j�d�t���U��?�/��b���D�d��JL̙b��S���@���3]���� �U�T���_Y��j��m������yۧUH�O&󡘂߹O��E���I\W��eo<T��x!&��EO�k�����υ����>�z?fk�	}t��!��/-M�<�A�
��gS�a��^2ǵ�
���d{M�P���l��lދ���j�2���g�q���l1�LzoN:-ec���@m��nİc�O��d�l�d!x%�+ �e��^���_�,Z.(�X�R�sN	mvq����Y���{�k<�G@~%z�*���Q�1�;)S�I���^$b�b�g"�]�գɨ�O(��ҧX���o�1A��m�\��	�]9��A��yT���t+[�9��|6���������v�(��^k�Qϐ&{����V�Tq��}iE��Y� ��ltY$�$>��*���^�y�ʡ�a������,-�+���&#\>��'�C%�W�Tn\$�*]�n ���Wy ��H�>I�עIj}y���ߢ��K���4y�z���9owG���͒m*�S_�o�+F&L%������� ��J09�"�Ş�� �����!l�2�eg�q+���\;<�F�M^]�.ӫe�b_� /XV)�!و�Ǆ6^��s�o��o��/*��)A���X�Q��,u�L�5�5��u2�0f��n0j� z��J]qv(0]��é8^�^���8���9hW�,��O��/�%�    ��k�n�����Q��Ak��i'#���]#�^�/�TfN����P�R�+,e.�HO5 <�^��w[���E~
�����6��eV�Et�)'��������7��� Ʊ�V��L�)6[Cn%� mC�!�3����Rdl��yYŁf�̒9V���/9M.h�:<9aG~�'~pMWK+��Agɉ�?� .��P�]��ʖݦ���*�=$�KFB���˕�&��D����r�{
�Oj �鴇j������O=�xO�0��".Ns֢5��Z�7����.�_>L	Nz�C#��r_����C����� �0���̛4̰x9"��a��B��@���|>�b��E�4�;�JZOb����Iw8��-�f>�ӻ�E"��� ��87�摙kr��!�.'���y��3���)c��Ba�V�l}^��5 E�����1-�׊��Y.��� (���3��Z��^��>i褋�Xc��B�+��1d�	��0M�'�Ă�4��ۮ!��R�k���F�r�$�;�{��󕖣�)��]k񔝻&�8Ӕ��J�#�(L°G�� 2Qư�[ľ>]�ϯŜX� �qF�P�|	bQd��]���Bof���Q,��oE�b.��6.͓T���X����f�+C,�\�Y����Y���z�����m�4���:Ӝ�I㭰0�7Z�l����l+d��d��S-�(��g>@5R�,\�JAX �d=]Z���Hىs��ЯD=�BC�H��e�j(�m�6�2�S�8V��f�b*��d"�<d�ì� /�{-�Z�FG��(y�|h�����&�Z��ⵐ:Ӣ������%�$�X��;V�iL/B�*�`!Y��V!㡸�K�^yǾPQ��B�X���D�`��\�x>B��Z�|ǉ��*�+2�ϊ{�a��m݁�Ѡ��o�;�@U�t��^���z�ȉ�,l
#j�/X]��`M���ٛ�dQ 'a�!�����/d��7��#�0b5�[c �s��)�AF�۾1���jX�O+qe�"[�Ydg_dnE&��ܹ4�
w��3��'R��"t$9����p$5��C��ZL��v��t��5�7+��6יʛ��9d"ujΎ�c���g���CC%�Ѣlm�Tߊ'�m��@<�M��E]h��s:��E}�n>A�7�ig2��O��B�a��k	Q@�0��;E�u�9��Z�8�W�ky�;�@�&x�%̏���]�f��J��ND��[[�?A�=��cn�H���F}��t1,�Ѩ���%��@�a΀�|(��O�e�%�:["BpN�;'��.=��FZZ�� .Uٵ�K��X\����CJ�q ���z�4f�V!��l� R�����.�-�xy;@a��O�}@d�\���**"�!kE��$�tU�>��U�ѓؓ4rs(�������2�$%��BcL�y���߽����:W+�}�WN��1�գ��~�ש��U�9o���H܃S&߭\�-�ǜ� 7��Qe@��Ϣ+��qH���<�p��[�`u�zڹ��J��P^o��ܭ�pE&p�@�_�0#v����@8	'�ۏ�?~��u'{Fv�wZn�'Pd����V��Jm Xr���jPE�w��� �}-�0}�r��:թdƉ ����2��P�\�Ɉ>B\]��'�$v��Bv�����6ug2��R%{pJI!/������:��}�{s+z`.���aþ��>��ZA=��"��?���@ճlX�XУ��ݫ'��>��cB8T��a��`�C��j,`����#ș���(�ap���5�y(���s߭J�z����ӓ�I���G2%~`0pY����Вv�z>;Z�)dc��f�) ���~��+ͥp_�&�Ne�����GQ
����L.)h�$�?��x��q�-����VP'|k1�m�i����mIc��*�?�J�[Cw�O�R�F���\�?T/t���wMI��4r
x~��h�L/���^��k���o�1l0�]-������j�#����<C׀9D�; 
�#-�8v _dI�g�9/�M�L�x��tC�l؎U�%���Y��>E���o�`�f�����*�*] at{J&����XޗPD(	d,O����C�hg�s�fyf9�>������f���$���x�����ЩX��j*��H�V2�I?�N�v�Y6��+F:����٫�v6���������&: 1��k��;�����@�p��J�@�8�O� �l�ޭE�����B��r}�2�[��CC��B�d%Id4*��b���W�F�r/�:V��ٰ���&ޕ�g�H1/w�nc��~�xq핧����|8�'_�-O��,�=�Y>:R��}0M�D}���uS�hڱ�C������ⱥ)��Dҥ|�MDQ:�0�kD��Kn|��P�1h-��@�(�\�=���^��ח�)ZX-4��q���)����� �ϳa����Dޠ\!���̀�!��@��!�Vl�a�Q�+i�J���P���i�гm=Z�_�~J�ǐ�[cn��"-C�(g�r�nX��\���U�v�+877��{1��Չ�,�`����p��<��X�2� {z��*�w�ӣ��ޣ�Ŏke�����jq�8\h��/{3����x�{�j?��������p�L���̥P�/�G�A��x�77>�����w�QQC��ө�-��� � ��a�Fu����Ӓ%$߂��6}�/�*�6���=��pG�=�ɥ{%���{5��ȋ�pՕ�;���y�W��#;� ��a�e.݇�x�ԨV��(����}#e�1�T4�KIL��d�S���3C�����,_�T��zP5,:��G�zY�;�+#���(5��A®�64�}��ɼ*=)�a�*���X��5���;_)����E�H�
�d6���P�I�:�$`[?�IQ�!�`�t�`UT��Vil����u���ZiԹ�*���ꈰ.8�����*W��[P��������Ӌ��pe�煠"X=13{�d9ݜ�X�I������^�EoQs��
3U�*5�,��v��m�����1�Zz����G��+�S��#���/�n���T)�Cw",�4�T+*P��H�g˔~E:|ۛLW3�����(ΛP#B�]��[W� YF��x2����� #�����]�v��w�'z�F��g@�X��G���`iӌH򀣃{K�?��o�j]�e*�JΩ�{I?B��_�d��?�NBZ��`��g�5Y	����EU�_�;h(j`>�Gwp� NS���1�9�l���8��ـ�������7_�<�#�1A[u�� ��t�4�ӷ�PykX�]��pӼ#*�^.������8�������5L��"�S�	������Q�{�>�
	cJ��6N�WM�!��2��A5�!q��D�o�ZW��Y�I���ؤ/F��_������Y;V4we�n>Vth�p8�Q�R)(��`�;�>t �q��JZ+6�����Ҫ|����]K��aTV���]�{����ԉ��?B�Pȑ�HQ�b@,T%���X|z̿����9�K8D��&��,�H�s����.�����H���'�]^���=����$��!!� k���\t�v:A@�Wo�?Dw�Z������_c����a�+����>������CJ"0��N&��Q"�Q[��}$���B���J	.Z[=ADq�z�7�^_ѵ`�ѯK	���Ͱ3Mq;�U���"���l�L��w�`�W��[��S�����B���3�[�rce�H}�ͯ�jh�Ȱ �UiVX����FC���o�ӪA`]3-�#n�1\wE��ƙT�➊�lrfdQ8�x ��Ȥ�S�Qu��uT,fe"�p�R�q_���A>4��u�mĨtJ3���R:�3z4���e�z�-���`�V���{�<���Ѥ*�Cь�a:���ai�ss�;;"���I�nU�X�!�
����t�eg��l�h:�Pn`    �`��m)|6���F�=y�icJ�r���] ������~��77��Z�^E�Q���� `�4�;��X�]`� �6�8�{�z�}�
��+P��R��#��n��+�����bl���m�8�lnCU�����O�A�:��M�@�����CK4��%�>�`���'z�W�ؿ�I��/��1����82O=�����}����aF���OHAk>k�:��_d;Eګ��k�L�t�ߝ�l�F�ǢK�����v@$��;'|\�$�����0�Ϊ�|���m�k���˂���BDjI-�� ��R�3�ۆ��r8�ݼ�����~b�vu�s��e�4,��Z�c�=/�^�d�I���ơgii��n�9�����aA�8c�U*�����$M�v�Q����C�E�ߟr�t��y����	R�%F�T.�tJ*&��N�U'QLѩ�q&�d��XsE~_�x���~�'�eH}�8L�%,�e� �����4��<�+-�.�3]����(؛�d���<�ʈ��񢹘�F�G�����#��9?<��oǅ�����*�0�$ڝ�ݕ�����4�D�#�Ӯ�-/��֧>�����&&o�qX*��� ��s�nDl!U@D!��В@L�u�m�� N�q��y�`�Kԙ�Ϟ}�b�WY� �؝5h���k���Ffy��j�%J��!�c��j9��}�����i�O�#�8��W�W�<�<�np�V2ޓ)��la@,�a�c�&V� �#��϶�5u�N5d�@�H)[ږ�E�6�E��j6���9e��Mvg��V'�P����b4xt5�]�5���q�?����%D��)��i��H_��h��$�g��?�?���|:�'�Mn+�u�c�L���MjE\Mz�j#�F'���L|��^��|�{�"XWj�e-mTR3���	���e�+_%[�Q�P��ϝ�&�f���2C�%b�4
�~��ۃ�,ZH��6Ry����U�;��S�v��>jhAS�
XGҷ:zz7Xx]@�̽�kkK�$�k骔���9�A��6VF/w3�ji�3���a��:!��e�Nk`��V�E�qBk�B%�!Tʃk������ب��M�}\M{����%��Z���Y��^��2B��2!���E�`y���,�v���Qk+(�M�U�1���,Ћ���-@��_�ôq�p��t�:�����4�JU�8	d��j�4t��bFʅ����EZ�a@�0���1Ȝ�U��?v�P�Xܒ��́�u�m��h�"�S���R�î0�~�YV�4���B;�ն�]z`b��^I��F���
�g���>b�8���L_�Dy�2T��>����E`.��+8�A���]؜=N"g�tF��y��,_T�E��(/����F�kP���iV���ie�A�u�W&C[�W�d�Z۪�(S�����/;�vP3�S��&��P�닥A��7���"r2�8c��s�8��:c�ЉM�֯�R�2�9<��.{ӡ�gM|}M��ϳF�5�G�Šw[kC����M�8�&_����
���Riោ��c-;���ϛ{=��FP>�g>���L��ɝ�'��?#'�Z��U����](<*����n����
�ɭP�ï��a�k�M�>#3����'7y�
�j.FcF[cÛ�H$�Iw,~Ry�z��&z|kM�i���K��o��Y1��٠���X�Q���u��n��CQ�dz5�s}� � ��b09_�㈜��W���M�*�;a���ɗ ���Z�
o����{�0֡0�4c��bf�H�/�nSmx������&���A�~9X�U�h�h�~�j��cl��?M��"6ŭpQl#��On�`�#LC��`Me����_z�������ұ{�b�v�jJ��R�g��L�s���6�}Q6�St̬�t���>^BZ����I����c6���rM^_�ߠ�l|��s�4�OL�w�~tZ����~���!���:d95��oI��&j�6|�6�J�_K�;YȭKūP�֖��������dw�����~Og��l�'���3Z����,p�C9�Q��8D;]\��5`c��Fb�AFR�A@���m��]#=�I���T�1�?X�|��*-��ބ�?���U Fm�ides���f
u����S<-�2Z��꒣d�+}H�M�'����<PO��{��}�w�=�W"h-����"{�!09��Èr�_����٘3�w�+�.t0����H�yPd.���t	D�VLm��bp	�D1=5F ����Xy�ٖ�1.��A�$d%��(�K�CD͌�U��8��d92���R��?郚|H"�d��@�{��N���x�Pc�M1m�C�&>�Fzzk	)����U)U��@'�S�g�ǉtUb6Z� o"�RP��B�v!�������a�d�Y�kvp)�tyLW2N"�G;��]�+�́�_�C`���ᬅ@7y��gQ���2c^��a��ym�|��m*pY��x������B�]5u��D�n����.nحDոٜ�ᜆ��H�YU}�|�+����>��I�(c��'��?h�cjHÞ�d\lmU�8���{f���l'�)&�w�2��LdF�0�"�0��9F�L?[��(Q·���Dc���̲�Ш���r)����5sk�*�Y���S�Ѯ��XT	hT$c�����mUώ��y�Ex;cY�E^,�q
4�>+g�^�i�C�ՇN�M���>-���c�,�Z��Ŋ���ي���O�ϡ��];ʼ�#�U��mڃ�t�T�Xs�4���-�n�a��1�Yc�b0
A�b;���H3Բj���BM�L+��+u<f�%��
I�����?���JlLiV�V�.�AU[Q5ꪃ[㺲ݨ�0�p`Xc�����l8�(o�:��>גW�Eʽ"��%Ȭ�2��*��jy��Yٓ�{��b��w�$�A�1�0[�$ ��G�A��<�:��AjΟ&�1��JNQ �E0����!�@�!䞆>c�Lv6 =�·�2\=��,N�Kb@�2j�R-���9ne)��=������tnhe���ݣE��� >^�\&B���xkc�z:��ymE}4>�Ti[�����q����"�D�HJEO��%��I�@����|y<P���mG�J��@�@��ɫ_!�����R,u�7�o	F_�vZ���H�Y@0��Y]g�1b��6o�tTD���ɠ@�L�r��d;{V2��l?�f!{��X!$�ZW��M�\b����Sv@u:���_����`��u$�d�"�չ�tսOb� z�L��<.�N�����jȧ0� �~�u���h�-��j�P.�Za^�M�e�:��+,�XPiٜ5쎍�.��|�7��]�}�.Ry��]�6p�*�,�/�����W�T4��M�Fq�T�R�ݿ՚�:Ux���]����e��������t:�F�kL�1y̋'�햑K�	ر��c��T��*�[o!�?�-��赝����ɠG��qZkT\i����;������,qj^��)���A~����7m��V�B�\k��D:��?��.$�g�F�d=M�P�qc�2S�1�k̲�m�*X稲�S]*u��iʸ��bKz����S��X �m`���>�	9�����_���-�^[U!r_:�+��fL�ʕkŐ� JX=e@��죛��$&6�+����D���"��N�x>6�l���/�/T����m���ͪŰ�����tn�V���5�sҥf�y��q�g{;(�,R7�d$gb���<��� �:��p0,䨈�L����+bC7-F��U��=�)ػ;�N���m��8ō[,F%y�ۺ+�q4�v[��ر�΁v[��Y�Ɗ��f�7� Wg�f��Eq<c��^ԨTZ�uzw ��6���z S��Ub�:��:����c�`���Gq'�|��$���;FR�K��sE>���ց�GS�*�i�w��k�+�N�ղ�?���箊f�{R$P�Rv��N�:g� l�Y�٢�	    ��Ƭ�R���N��J����<9s����U�T\jm��N��2�槊���K�=BI<!ɘ�YÒ�mu*�KC�c���ޟ�U�:m"�Bk�!B�;���
�`)��)�(�b�X���| �Ƶx��Y�f���h2[�{~\�(F
�|@��:��CJ�o�J_k��҅1Ի��VU�CA7E?���>�omy:���7&���twD"*Pɨk�nڧ
 �� ����kh��zd-�p�����j�m�!xD� e�Z_���>���D9l��6�����6�}̈�kE=���6��q�����t:�$�j�4�8��瑽���}��%RUk���G�;�)�I���
t"6t�QN[�8����@��Bd%~��T�.��rLU�dAYX��k��Y�[��9���ke��3���������KJe�-D2���$MK9�#�,͇��Z��p��H7`t8[�ƽ7 �V�����B�Y��I�d1zu}n��_)�����h�pIjX�9��8�A��Ǒ�����?���A�G���9:�?�+Z	x�PH�sh�1�Φ�M��\1V�FqDЯoA�(5�hU� �˭CM�Bټ�$XD��Ɔ�V)�QYY��`:P��������ִL/�P���g@/�>(��yIH�Ҍ��R�y���Wb����з��묨�i��
�Cިj� �l`����(4i���`�D*i�UX��ǽW8�Y`�NG���B�����\k�0��_:|��	L�KW*��HDG�]�ѓ���ħ�Ub��V�Xނ�1Bs����R�k�5GJ5��>���hh�0h��7���.�B�+aLf&о�cVWjRp�����O�ղ���m�Oz/��g��=���<��E̱��b4��G�x9d��t'�%yV���'9w{��>�:Ձ6���[������i![��[�Nk����� � ~�ܵ��SӢc:�0����Pz��W��B���Y���<��g��\�4�ն��u7[�me��Ҿ~t�>����j�,;U�l�u��,}�U�!'YD�1�WK�2��:5_�Û#���L$:	U��%�$�g�Ic#�m�/gG
��ɳ��0dd!�5�{L!�(��ur	�`Ցm��Y���樢z�j/��k��i���`4��3��ԪӢ'��hs%���!P0иU�1�U����P!�ͯzw��� ���]��f�Ѭ�ۯ�K ,��Wq"�|�4}�Q
�5k��H��U��)	%r�/��5E�����- ��[�џ=�+h�W��5�_W�{�]ME��E�=~�� �M�*q�0Q �����I0�G����w���;]�V��kP�ie.R��ã,6"�ܐ}��&k��I��Q,�o]Tb�I^�y����Gd�Q�~�<�)�n��n�����)MC����"bѡ5����^b��&��'���|����z��iO�X��gC��6�6,P��uS�������ִ��n�k�=Sv,Y�B6�Q�C�У�Ό��ΟQ�ps��۴"G��)V�vm����qp0K���b���c���[eӰ?B}"���/�¢N�XOpH5��ۯ�Z�?�4���pUj���ג�<���n�J����i����DZ9E�ԍZ7�X�/vܺ-go��Wi{�p*�"	��Eh���l �J�5�����47)Ʃ�Y��-Z���ϩtu�Ӛ�:g�;�*��:�١�Y���ƟYO=�ً4������ ��#�����<~s%v�365�����}�)�����x8��.{��rA,=e��s��Ǳ|��U�0Z/���m�C�����#v�����mlC�.ok��D]��ZQf��� �fm�a�����Xl�y�� p3f��d��^��O�7 ��y��{�&a�PQ5tq�Dc#V��"@V��4&��/�8h����r��$���2��x�䤱%�6v�/c�� �_��l�U�*��f����;��Mxd���E��쳽G�2^'6�X�� V�X�r�I��W;e�Lؑ\Z���UԖD�uXw�BǤ�ǅR;cF�~���bԻ)�]��D�4y�$�ɪO�� ��!M�S�;{b��U�������� uZs�4�4KjH��b��5.Ӆۡ��t=���S.hV'����U<Z*��!-+g�7e�qh,\���0p�|ߴ�I�j����|>O�\�%�4]\8ֲZU]h>�L�!��R�����O��1��B#E�A�}0��Ǹ�cf6C���8	@i�'S�'�j���P�k�G�K������zhΪ�P8��E�}1�L�b,��;��r,?���4�L�ڪ���t�0��ɿ�4�T���E�r����WB3|�12���Sv��`%\�-lBx�������>Z �^�#�*�J�����I��nAfk5��!%�W�N����o�y��ƌ"�.�x�X��FC�f�	}���j��B�Y���b/ ^���Tpz5t�i(�we�Eͤ�h�3����h��f��hb�Ee��|��^,�Tts��X���KW�Q��g?b�y�h4O���Y�f�gݾ����&�\X�$���1��j��$3C������Ɉjp*EKª�Jpf��ZT���� ����W���0����2v��ɗ��
>e`'�(ekg&wk�s�O�U�-���h�?lv�m�z�X�Ʉ��b��dZ?}�LGk�:�`����0��l���W�ࠒa��x�0s���Co:������b�;��=�(g����-�����]]0�ܲ��j�^3�P��nu߱�^�����J�Y)�����p�:kn�ԪL��T�����V"0�[4%�_LaKP�����,�
6�,�>��Ｘcj�aI1��-�����uZ��s4) eh�xt�b�_�S2/D>Md�߁�x���X��3cTz�HDJCo�HU�;2m�:]D�;��E�o#ՀI�o��/D�ɉ�j��U]NL4���БI��ߴ� ʇ6����2�1	���u;����W��+_�%�ŗ���Z�Y���֯C��Z�R��]g���#�$J/�����?6ؐ)�9���h�1�����2��@�}��@��ߗ���P
�FkB�#�^5V�m��'�Hw.�i��S�H6�עC#�D��V�H!×����!��־'8Xb&~r+cɐ�e�i@�b�fj �n51��
rb� ������Hc���	�2��� G�m$�E@JR��-���ZV��������8���r%�Q������4���,q8H�y�)����+ţ-Y͛TF��]�G-��`Y~��Ӟ%���Q����Ҏ��T��+��Z�ͱ,	�y��o�8���0s!r��������+"�F�����-�:�R+�Z&X�PL�ˠkAEdY)���b��})�E/ģ��Ӯ �M[�7��܈��;��X���4Z"|Ѷ�[v��	��;k{2& �/�,�,h[S�Oq b�2�Hn���Y5^��c��R�$�W��t(>ݗ��ǎR�|8@շ8�{�@���y����|�=3��-����I����^���J@CK�i��y{�˜�qYkgw�;�P'ћ��%�<u!��V��;�yKea�#k-3�9�� ni��} �s���4I;�!k>�#��׼- ����0t���᥻2�� �:^�r�N�d��t$��S>�Y�� \������*x���C��8��/r���y�^���݂�����>�cH�i#�Hv�g��^����%l�:�āZZ��<y,�k53i��Hq������LJ�t�k�5�A�Kc��\�~�؆0_*�~B�W,��!����;��O{�o�3�à�gG�d#����d��v�u�:�f��s���e7�gx�N�ys3us\gj�9h��f)?v�m�U9�0��*�^��GN��Js��V(d�+6�"5�A)nTh�:rI).�CE���.m=�@��p��{�!3a��@9��%�"/R�	�֌?x۰@}��/�f�h��{Y�2~ۨ��t<��j�)�3��Y�����(8 �t���e�dY�_O,    u�k�kB�b���HD�u�F0b
b�W�U��%\ˣ�I�cj��O$$����%D�w��5%��]��BP��;�r_����jHie*
C��͐����V���{�����~�ݮ��G�3C<';8Kޤ����9�<kw�76=�"*���1���6��6m��vg����~G�]1_�,�4�	i��"U���4��;�b�%���k����R���H����u2Az���B�2�,,D;��ނ9��M��3��&֠��Y�N>4c�=��ԲB���SLFХ�,��^>���?��J򠸟L7���Y�����iV�*�Nε�E��Лyֻ>��hգ*�� �K��M���1WT���e�E�n_w^�q�b���-�u���G����G%&3� Ȣ����hi��Q��'�P�����PTfj��_�ÊD�g��g���e��S�X�PpA�<_�r(��<wba3�q������dX�Ì�2�b�#���	"^s��=��g���qh�W����c�.�C`�ap���~I�Qi�ȗ�Ϸ��Cկb4�e/�O�o9���R%wP^v�S����Pހ1��
Д��i)P�U�bw�\�����ej���鼯[�!��5i|4�%}��%_E�TEVs�[ʯ�J������c��4��7A����!���t�-=�Ԧ�@+y�'Z~S��ha�e����51 m��T��f��mH��t��T}��Eì73���p$�zN������h��;�)\������`���w��k�[�v���h�ܟ�b���Z�,v0$<�ɳfuz�^��y�C�S�k*>�8rs��1V���P��G����Z�W�A�wG� �b�FM�禞�}��7�n��p]��l���4�o����X�b�ή��A��q�� ɐo�=+X4k��֪/v�9�5���)	|��v���a�Z)
����o��\Ri�b�Vx$ k�ӏV�E?ʲ��ԾZu�8b�J?yЌ=���`b�#s�\�FY��^�Ƥ)��n �`�{��T�Z+��ďK�WС�r���/*�VE@~v�l��Ð����ظ޸�דS�hE�T�Ŧw�T�k),��C6�2-�����¥�Y�����a���ԍ��++	�VRݰ��F�S�[S�zk�Ȑc�(_�Rd)�;&�u���K�			���s�6�ֳ?O�x��ri�:en ��oRFK���e��F���`�����M����������(�/�F�瑴&����B���&��3W�"Ƕ+���J�n
�򋺸�6Ek�wC`k8��]
6�h��&ي�C��\v���(,]�?$H���!����;����/Hf�;�/���S� 	���g�k`�1d�%CiD�E�Eר��^��T�T�Od���U(j#OCx�X:i���� �� 
�|�R��]�a+TH!��S�%�_�����ڗ�4QJJ`x���tp׆�����1��e'+�:슺����6r�mͦ�SX~ ���;�J���H1*�K���Б�O��P"�3�ʁ�.�g��g#�����v��<�qت4߀��8C���6j�HX:���a��N���q��`f�Ϛk�d.�KX��������{�|� ��P��~B\�OD�ް��-��p>��5;�޽�X��ힱ[*�dѼI^�ff[�k�¤O	^��d2�k��j�L��Cs1orsI'��`B �.��Uak+���D<���f�A�u�/��l﬑�������?◾v �wz]�Ȗ����fV�����"����ΐn2�;w@qB�J֪��W�n	���۷G�KA�2��Z�I��G����A��;��$ �9��X[(ӈ/�ź��86�q4�Xe顊��ë�H\��7/޼�����'q�'��DG2����ϸ�Fad�X:m�􌭳���®�}a�F�B�h�7�^:��q�y���޵ ҷj�h��`6��_L��3Z�t����Z��w�ڲ��^X�UO�4��ne�i�o��4Xh=V�-oYo\e�ϖ�� ���
͡,y��y�^蛈ݱm��b��::�-���!�W; b���7>�a_����$�-4�����V������WPVW�����e�j�fW�e�/R��iM���jb����(��95x�b�H�.��&M�m
�/!��2����MY|a�j�C��QE}���"�����4��YZ�F���%FM���p���ە'o�/�����wM-����ڨ��w�d����ݵ�rb4���]�s#�|�"����eb��o�p"k����*�L����X��Z�xj}u���=y� ��^�H�m�9ͪ5�-��Q׳�;���Հ��礍.��w��]�E{��Y��q�C���P�Z`��`br�%�.sr�.?od���ZT���V߾oaam�`G��-w�G�my�3Hqg�t�XB��y��X#�9��s�y��\����A>�s��%��k#�0>��ؗwM�|��$G��U��z����#-C45�A,�t�,2�)��.W17�̈�镵ѲnԊk\<��FgSР$���6J�x:�:+����)J���p���Y�5%�2EC����%�h'RE'$dDCZE�+�N��Z��C�����Hǲ@( ~�f�
�p���4F��h�S6e�y�oP��x>��3�Լ��UQ#�Q�"�L��UC% <���{�3�^�J�����*�/��ɜ#r<X����Z��"�ŁU��'wF܁z�
�]��*{&�:� ��t��9�OQ�2�BYJ�8��Y��_=� �:���6�2�Qm�<-z��"�t8����L~E��L䷌�����v��̡���}�W�4��D&/�"��j5/��Qg� ې�^w�!4�a3�5��d��U"z�0�2<DY�􋋰��AD�.�D��1����(�J�`B��<���Q�(�L��mp׈ڭ5h܎Jg���[h��p�3by�O�y�:�M'�އ�/������/?��>�p���]r���ÝX�/���;f8F5@j=^2�*���C02��l*&d 5[s��遻�w~�O�w;qOYb�L��ԟ7�a�1��4�}�2֛QT�j�vfg�Ib���]v/J�,e%ͫ��&m{�����p��N�
�~`��ҥu1�0�
Fc|+cQ�V:�
�r�L}`�f�Ks�,��#TJ�Ц�B#�����=@��El�y,!��cQd�.�+Ņ*{�Gf�0f�:�@�UA��$ �`�Y�'6&a����P�,;��!q@�����cR�&�f@�5�e�����	���t-��p_��UV.�$�՘���)�)� x�;�.r��T���$Mf㋈ѠK�ı��Y����������Pa�R�ժ"%N4�i�6v�]l��@��md�s���c)G��XRАw�{�^9Z� �)ڊ��h�fGBΆF�4��q7dh��o��kX�n��*���.{C4ݼ�<B_��<wѨ2����17LG"�d���*�(�`$��S����-���5H���u?A �BX�z�4��Аy@`�y����!Vǒv �������ޕ�לْ=��:��\��2�99�$�Cc���Fdbƛj���Ops`�.L����@j��A���~{�NmPY�/-�fK�% �/�[�6��O����0�b2ڵ-���#�Q�?��'{hK��ɋP%;�Լ��n����U��ߊk�'�/���L�Q��\�N+��P�U��i@ц�>sf���^&H(�g���ȧ���P�:�jq>��䔗A����6<�����̤���WP5� j�$�<���*��	ar �TPRr&��a�0�.D��߭L�U0�#N�xi[��EXd*P���r&���<��0����̡FB%��P1B��Sfs�Sa�]�>��	���lL���Ys��
~[S1^UX��z�����#-�ZWqȕ��P�|r�G=B�*7���w�Y �ZR3M�Q�?U0teș�Y�ڝ%I�B���sU�.ź5���7[hl����]�_4Dg���<�)Mn�<R�_��Xv    Wc�ך�����kP|��ǒ��&�Z�qV���'�u��F��A�Q�@���J@��}�4�Jb�'���.�`VS �W_�¿�A�I��V�흞t�|�����M��[�_Me��m:*��jJ�D2�h�R[�N�*&$H%(�pY辭�6�b�-�_�j]`b;��r�u�l��2h}Ib����!���[�9�?��ۧ����!h��<@)g8]89�
J����]��^��}��s[W��dW�����`8g������n'2������q�F�-����J�ã_G8�:��F����!�i���иQ �0f$�5(�OXfy��eV��)b��(a� :`B5�c�(�����n�2�0����'�D;���Fж��l�|Y��� l.�0�����"���>e c1����T�ѱ�J��f�ߓy%=TZ�K̹��hWz%�H���H��DJ
E�ʊ�|v��svB������J��k�q�J��ZK��E�)zJ���C��֎ٌPk�fb���1��)���rSh�ٺTJ먁���.�GS�;lAlu��ZBf����{9�����k�qWC��T�>�h�M��C�He��]�B�(1����U��HRy� C�����~b�YL���:h�E�)ȟ1D�B!�&/؞��u��!��DƎ��N�o�ô��R p��~,�ٱE�ݻ53�zX�kκ�Pec@32_�s��0Wa�B�bw�Q��KZ�r�m�~�DoF���K��\���d&;T �=������"k��]�`�4i!����1lSy2� � ���X3b\grZB�ft5�-[�Z��x����Y#Z�z�����Y��t���ڈ����-�����+���NMQ�w���>�jۂ�6�f&����G�j�#Syk�)��lP�~$���.�GU6��C�-�Q庫BO^:��N��|e̝��=]��r�!�aΖ���tfk{����M&��Tߠ�N �\�ޘ42�I7(t��L�~��ϋ[[�Q�;������e͒	ːB�-�mb+�$��qh���Q�=�~��Z!=�֡
�JB�7B(u���+
.c��R4{I��;�G���I)�R�!"��-�v�د
���v�t��sj⍺���BVK�筑j�2�H�}0��o�����a� 6E:A�4䈖+�?��7��SK�O� c\��,�{���l���Y�+1*wN6͕E��F�N�ϬAC�!�(�z+�-�w�;a�kM�������c�A1���)�}�m.n�$n~����t8z�,�/ysh���6 ��f�E"$��6@�x�>��p�!����m<��b�h):�e�ڶ[�	�hK`�
k9�����Π��>:;v\ k 2�\q~�m|�$���AA�^��@p���CW��P�T�O�3�:x��
Z5�����!��3Dd�Y4��Ԃ�k��y�%8�|��O����4��dֻsYĎvp6܎u���p
�A�K
eF�}Zb� �'�7%�A��D�60����;�ۉٞ]WSDĭ�B[Y*�G<�Ƃ+�Ӥ�avX�K�O�>a�3|g�%G�h�i�.-�𑼳!��h,�Y�Y�m��3y���*Q@��
�3�b�#�����\��VM���3��#��ʺ<��!�n�=g���0��`\( ���hq��[��E�]k-�V���ElvAN���l͓r�3!�(s��j<��@��A����0��D��1[��x��������k6[�ʝ��]����\�/'
��`o���}+�R�Flf97��jv5��^{���/����E����-���Sz2��H����?����%��������=�e��\t�r����%�_����/2��qo��˩�J�!0��,������x�l��6���Q���y�>�h�X�g��S�G�X�Yk6˱ƛ�͎�x�튂�T�tT�z:8���x(4�7U��$콁
��8ѝ��(��Y�Ł�9�,ۑZg��Y]���F\��۟�����ns����ƅO�2A���J8l�2t�8;��_�'�s��cV��:��=Sm��i�.��|I���~�����¾�W��2Zo�82~��=���6,r+5�oN��3���1.PU�âIU�C�7�s.x5Б���u�Y��F���
��,LW���,L���0�c�]^�/wt_,�?L�W�����)Ѷ^U�eLw8�:�+̟79Ԧ�i�Ven�j��@��>}Ji���c'�쀕�]Y�4�ڴ�Z�os��E�^��� �b�d<��
���u_�`TH�`q�4���/4��&*6C������tO�d�D�fB�M���Ət��
�-�'Đ[/�`���L'�?��RtH�� ����v9��C�B�B +��k�a�H3{%���6N$�IU^��7\L�D}������]�#I��u�����*Y �x�ً2 ����$�*٤�pD8ވ�v� 2jՔ(�&3�I6m2-�و4rA��R7$���n���9���=�Y�3Z�c�����8��ݲ��G^QeNL��X���I�>�iSC���2��g�g���a���� x{7Y]�	�a*2gMIGCq�wٱM �����pg
 \^��6*v:/N;�f��?ݻ���T?&qX��l��mtJ�^��'�/��3��.�6mI�)Uu!��fl���ݑHe�(w�o�(�9V�*�i����^C��h(�᷿J�p���M}�چa��8�44=�рX���ls��Zƽ]��o6y��C�p������9C}�v��ߥk�N1�	�	���8�6K�]C�#n��1o�� 0���muL�FP(gӮ��f�@`X���Ya�q�K��$B"v�hQ����2�p�Y�/O�(������[4w]H\ڧ�T2Y|�Etz�!�E��Ԓ���� m�=�Ͻ0u�����ȝ��!�[����������Q�����7,�q��yo��� �eV;�kSS��k�˩
�>�90���w���	'�ؾ(������SG��Tfs2[zW�u2om�Zm���h�5�]u�J 0Er��0�A�\�~� �f��]~mƋ�A��(�m$X!��d)�R�p`�%����ӌs�#=�OGd����$i5|�����e7A�Ƴ̤ւr�F7A-t6��Gp�Z�]�p{t�t�M(aB2�ќ��u4�G9��
P\5D������ͳ\j��܏�/��TVٳ���b�n�-�^7�_o�	�������c�{6�˥-$����?񁨿��o�&qsgB?�G<�c��w(]}�c�����B��'�޽k""��7�+��A�E���Hچ��8�tD��8�q�ݸ(F3<-Ĭ���_�NFW[,�Ağ���"�!�*��_�iIu������N���6?�,��3Ʈ]8��� 8m`�5a]��8���e��y#�-��F�}٘�~d`�}Yg�d�Ԗ��'a�ˏJqB��*������4�2HI̦��a�	fRs�}N�̈́:�.�:�����M&ӷ�VQ��Hb�-zzt48u�%x�� 6r�'�� �H��*cVWMmd��.؉3���܊�-��*�5�Pl�ܒ!� �U��E���T%#)�s��bE�}�lmR��M)��i8xk&��$�]���Dtf5�!�g�,�vJ1:)��ǒ�p�E���&�!�SI��\� �[M�	�LzS�L��cW@�3�<��e��1���8�m<�� a=���[������?��/�}��M�B�न6���6ZD�g��<�oP�����Oko(+H��.�$��jh����,����@�ⅱU\������G���?ѵ�M�v�'�K�L��g�G�C�W�Y�B��hC��!��4#�FZ(KZ~A[_,�I�J`J�?��_mw�Q��$�'�n���np��,��ͷ�xB+rL�۰aǣ ý�p�Nx��=�X����P� /`B� ^��`}[s��)�A��^������Ai�/��<�Pw\���k�"�j~��Ɵ�:�{����6b��ak�    gw�&]��D�+�5��&��)�Y�A4u��a�͒A�2�������v�M����yHN��P��v��'��{j��a������ l�i�Ŷ�d.�l:C�r����y���-�a�Җޛ�gvt�f#%�~L�;_C��Z�����<ssl����'�29�O�����pF̙������_��'�J�k,%��� &�C���A�z� ���ժ��U�`�	R��X�$��]�Jz�u�Ҕ��Hv�?_:�,�*o�WE]N��ۦ2[�gd}T�����F�]{�a�*+F'�TUv������VGg������Ҵ"�-�r;AJ�^;�ť�V��Sց�R�8�� �]K���y�~k�Kj�Ň�_��u�j���/�Q�$��
���T��N�)>x�Ԧ|:D�5d�1S�Z�MN7���[��uF@Axb�﫫\��䶘��ʞ� �-�:Ś"5�P�h��(�V�UO渝:�ױ��Q'A��SV���r��kc�8XX~��q�_�5�Q��,@�8wS���$��E.�jR�$c�9H���T��6��e��#����,n(6�}]u?��
����IG�G�-��
�ܳ��l"�[����l����h�v�R/D��Q�$<c�z�6&'��tu7����A�����·��~��D����v��Mn�
�qr_�1�׺�0:�#N���=��n���^��j��-\.'�_�@r���l`�N�/2�xh4u�b��C>�n���6uʩ�>q�Q�<cM�S�f.:�j�ޔ4����H@3�����G�\��	�#��K�i�86v  x!��͕���u���%�Os�7��<LI�d�98e�+g5�#�K#�� \e�3��(~Մ�9{_ۿ"��0�a9������63;��}g��ǧ��Px* �|S~ݒ��5�����y�9y镜g^�9�ޱ��!z��`��p��)Ik��Ξ�y<	��M�&26q���&�.n6l؞m3�����{��HSg�j�B8����-Rjh��hln72�]
��e�#4Y"�##4��#�7ioo����'�v���U�Wt|�S��/S�
@~
�l�6��Y�S�u�B'��(�#��VN��_��u�i��$
�i�nj�����VP��V4>��o�b�-2�ҙ���KFc+H�'��ux$�*��7a=�r<s�>��wHj�f�]輪.Bܬ���Ь�S�u��~�(lH�0�'�G>�w.Ϊ|Wt��+��ت�^?}�����(7@K,����0���'���ܵ��� /=���px:��%4�6��km�^�ZbΆ���p@�A���F\�W���`�~E�O�iO��Lsww�BH���v]��R�*�7h��) �H���eq?X6��Nղ�j������Z㠨BK��ݦ$W��·��<�;SM�4�S�sW��Z�Z�&��������TłUYu�TԿ��]�<9ȯ����J�³���;�)��pK}S�݆�]�O߼#�����/Y��k) j_�]o#���a���_n,����� niR�ұ�_ۿ-|��K\Z����J�O���i̮�鿟��3�,eӫ���l��ᒌ�&�����"~��9@����A\.e�jY�i�e��ʾ���p�H��=N�/����;GG{mO������NF�'���y~�d�}NeZ��͆��:�����S���d���Bn�����,��Y�!H"�]�Y����߼%��x�y����m����A��]����-�_���6�4�,�K��+ �-i��Nҏ\SO��A�f��{l�v
�@Vjg�/� g��$/��1֢��6��"��W>�pp�e�8>�� Y�t@St8�8y<�|[Ζ�kʸa�6U��P�]��r�J�e#�?|Ǎ�Y����ΰ�*�$P	�y�����$
�
�V��I<r����*�{%��Nh��sOX.�59Lr��X�;���knt�TyG���~�"���JVZ����d3b��G�s�ccF�T>Ë}�]�Ct(��J�*�j��������9�)�� %Q��� `��4��ӻ\y~��A]���-J���ע��(�<��=�w�:��h�J��C����� A?s�:�3�����'W��p|*u�k�wX�soH��X>J�I�7n��kD7wE���Un��(p�3BY `�$��-ds&�ʆA�̱�	ǝW9�i��r�����Fe;�p�K�6�� �d��*G�j\��\
Q�O=0�q-�v�	1��M�{�(�~ؘ�l� Z��wV/�ҩnT�]�ax���{J`ad]P��vd*J,f�ƨ��
�|o{�FE��Ś�-���{x���O}l�o,N������5��NsL�u�K7S���
2��!W,�W~/7� J1�����R=-8�����@U�uxJayػ��i�ן,v|@<%B���V��f0;sY2�/���}3�v�$�����O�l�VS�U��k��N����J�U�onڬUq%PgF#$s(k��Ɓ-�*�iZy�SX�u:z�&�u. �y�>2�P�y�X�����"yׄ����>T ������}��ՎO b��Ey�2������B�ض��J�|6�7m3;[Z��M�Cm9E���Z_���M�}�T�:�6%����8���ܓ+4����n�(�4",N����e>'�f*�;K��D(���i.�V4J��ۄ��ǜ�G�u�cv-���[� �Q:������l�A��qRp���5����B�D	�	�m�{@$����b��{>u!qΥj�\te�ʠ�'Ӛ��p�3��]��@a����p�-WuB7����Sgi4�_�Xv8B��ՍU	�:@t��� 8��|_$z���,��8��C5���1�� )Ke��_�!��`�Nx	��o_�1y��k$:Qk
X|̵�K��%���77D!���X��6����\���p������[e��?������voS��i�(?8�cW�](�D���ֱ��³��%��?n}���hJb�8�B��BRz�����|4��C�q~k�Y�ŷ��iNg��xNwu�T�b�3��Ir������(g�&eה���|,u���O��=~'bԴ��dc�5��|��Ϩ��f��ݼ/��ͤ�c��DT���P��a�A	��bp���K��e��/�����fq�m�?�D��m^�7Q�����Fک�f�Q}�؁8]�HΖ)B��<�
�}�/�A�C��pp/�?6�0�Ό���O�PZD��c��[�p7����_?˷U�U�������(q�gm�$I$�!��&Ľ����F��A��$L1D\�ͅ���u����� �z~{�mׁE�ȇ(��Y��(ꫜ*fW�XJ��  n���+�E�����+����;���m���]Jf��x4��j%����ct�<��LF�O*z;bn�>�Rؠ�io�����v�N<��)����e�iw���|@<��'rKf��K��_LI��Y�u(<[o��}����g�ڌ�݅��Ύ��m*4�q'	)I���݊)�*���a#������&��[��n9�_��X(/vkdo�@F��?��֔�g�C)�*�RYQZ��y�N��e�b�Ŏ��Pf����P|�v��7���G�Ӯ��%�J�)�ŧ�C��&����	��T�%"ߗ��:�G97b���Kn]��*�j�s��Gs5B.K�s��̣t �b�9�\t�|��ш�ibb�3�G',�l�����̰��L�J�n�������Q=�v�/�$6}PRD$.[��`a��
ЬF4�{����e�߽�=��*���f�j��bjh.&�o�������!�D��	�X�c��%v�݄�lF47���(��^"�^�@�ܠ�Äyf��|�Ф�'_�ODG��cr�:iX�ϡ
�������7zU4�R(�ֆk0���2	
����h��"����u�k=s��8�N��V���8���:kh[P	{��	#4�'�����#o�}j(�jO    ���Vi�!��u��كD��=]�.�����K�.#(p�i���7B:�o�"e���ͫ��xO��z21��Z�>j��6�^��Z����H2$EC�B�Mv���NGB���+Gp�eB��͚
�r�p�� Bu�)RHYy���6��v��U7��ZO������sl�Ih)A�ؖ�R$ݪ�}{Y��c�������bR�I|E�F�[E-��� �[�IM4�v��B��p��玸j��+�Szz�y����eXϒBs�?w��Kl��ŏ<~��.�����������e�����|�t�T��3�㡻��;�I�'�_�x�kz�֢�_��<�AN'(��JY���s<���.����a��C��>AN�P��Ф�C�~ݕ.��������~?��1x�"��
��}48u�oy�?��x�VC4FT'���"��u���}נr�9��- ^�.�J]8|��F��bM�(��hDֳ�%�W9�w^>Z@/ٲKp��!E�Lb�;<�(.Y&Z\�Ǣ���EFq���-$;��M.6�t�r?m����%�,1 �|��g��i�`@�Q�:���K�i��B��1�����[kM����U��CE�VP���;"!:/0*�i�X>�� �H����'��E�ǝ��"D��ٳ�g�`�m����vߧ���M1���)䩜\s�����mn�ݞg[�2C⌊.aL�̫rK�'ɹ�A�Y�z������ �C
5a���Ĝ�qGm؃�o:���i���C����;����JZB�|�:,���ō�+Q�'�6f8�<��y�k�p�e
�&`:1Pʷ���~)=�H%|�*ʞ`A����]?�Vu�DP����A�[/�d( >�A�u��	��ĵC;��`u���7xI���A��`㧡h�)��o�^A�W�PY���i�)W��]hIέ��L�Z~�O*�	*�>�G2�w��MG�Ւ|��-kӺg�뜡|�u���m~���:q;/�11�g�c����+*w[ ����G��\����6��Gi��9�x�y��UُN�LQ���zw�/�$ w7�c�Fw�� ���9��?�O��}��p��Rч��X�T��M�5�P�	��9C$c�s��mI�r��`*�Wq�Y�8����nO�������
��$���\d���쿚�>V�+tRȥ�s�@���iF^�	c�4��ǃ�%�v�*�h<��h��pd��$��ݣ�q�;/i��:h��YbU6"��(�"��{�v�^��6)|Ö��+��/���{^�[7��&�S�h��A,��9�NǇ�H4�'dF��vE�vQ?�>��M�J����>���������p0�"_�+w)�3��ߵ��v8Aߢ�Ii��t�K�i�i)t��3��3���m�Mdm����d;b����dmSSh�}*�>7�'�}0���(�����S����;�;�2�Փ@��%�P����2p+7_�';�щ�f���6��qj�*=��8f�Dw�Ɏ���ƍ�w�/����i�T�U/��_���eiIY~�Ң7,ރ�a���6s�g�ܯ�͋{x�뙫����-�j2���3� (_����:N���]�#Dy#��^Z�&\�;��,K��{�=�`\��FTI�6-X"ez����΂�q�@�M��g( +AN	�1t3kV	��
ՍQ ��$��F��hJ [!k��+�R��!�G�h"�0�{**z�����éHߒF��*oq�����%��In�b^P��&K�E�j!�p��v�X�& �!�A��ܲl�����j���x4�4K�j�烥�n��D��nc��G�Z��L)���3`�>�[���3���|���KHѤ�&�$x��-�e,�9T:�$0ج�_����,�{��< ��|����[.��!:�.i�X��6�	�ED�V�_-�����*�}�;*��t:Zzr|ҧ��4��7��Z�Ϋlq%������Y��{^@eG7T%�w��aʶ���}-5M�$��]��һ�R?Y�<l`s��%{*4����4$]3*�nX���Qׁ�K*�9��9ڝ�;�ۄ��;�w�;�bI������j���H��G��^m����*1��2h5��	����b�r$����=�|/�z⥣ƨ<��٢����W�p);��$ͺ/�Ԩ����ٛ>��~��p$t��K��N�|��Ydp��ˍ�����āG<ġ�p��ǽ��؄�$ȵRN$oM��2�3��'_v�����eo���%o(}�k� ���K=���f��m!��X�&�����s^��ڽ�W�|���=������d�Ӵ��N$`ݖ-D� -AU�v�Î�RK�l?i��a{8�\��k�v��������И��>� T�̣�l"�0��0�Q��F��O@ԟ���1��}�T8��l�q��摎t�����<�:�Ǭ�_I~���n%Kh4=�4Z�b=���g��n����P%�{�	@|���P=���K~y�-'[��{]�9�S���g���M�q�i�jZ�"�-E�:��[p�j>t�{u���bU�9�+������T�HO*n�Ե���gHp<�#��)4.ls���d���7Ͷ	Rn��?�v7T�MM�t� ^�.o�l��-�g��!�tb��-�a�x`��C��=�wv�l#�'���@+��8n)��r;�G_=_`섒�ˠ�;��eISh��2Q�S�㢒�������
k�5�2f�A����ض�S�N;�,;�*Y�a�O��n�ߑ���\l�� �7�m�Q/��t01c�� �
��~��{� �9=��dk�KӆC�J��U&E�b�-z}�NZ`����:츊�\C(	��W�^�@,��B�֕y{	z= M�b6��ND���eS�f3xik��.3���M�(1nɓ<i���)�ti�<(�'�b%X
i�N����;�̦������dx��54���R@���{g����LU��^�x�R)��e�n �[��ɧ �p������6�v?�v��p|8Z��y�%����l����76�vN����~(,�V<��#-�+l���z���%4�]���dh���>��� e]z�চŎˌ�!g7�I=�b�o���r�zXf�R��}*��<hr��	Ӱ�]���^�h�H{�S"i95�y͎ �^�զ��A����D�̯Z�M�6׻{��� �2�%1�:y�q��1{<�?��D�Y�ͩ��.�����A��k�
�vR�9F�V)���~WT�v��s�|m��$�Lz�H
�Ѳg8�����cYg�(�*mM�Gh�Dc�-6�P6��!�\�G��hI���_;�H�gDY��
='Q�&'��7k4
�w���$[�_A���?�g�r�-�gT�A�3���C(���]Tǖg̠o+s4�{�eOr�@��|��-�XyX���%���tϮP��zX�(@6��kQ8=��N2"G���x�phN���!7�#▿B�%���O���X ��m2'{w��D=~+,,@���Ҵ[�5I=���ĵ���♥7�  ��ҽ��E�#J�X�,l������v��%���ۮ6hެC��Y>��Hh���˗��8C֎�%���/�k����f�t�ךu���ts����>��)�
lX�LM����ߘ��},�Igtz|��u#
ZͿ)�����|���կ�G�T�G�K;ǿ��^o���)��O���nl���X
Q�!��k�ztF�������f%���fu�8
ϻ$�bE�h(��Q��&L��r�\���T��K�N2�4�B22�~u	0�2��.Ҽ�l��ڟ�6G�!S����*��*P�6n��4zXD�h�(5Y.ݯ���-_|���4��h�[�ƺHކ����G�6����"��GS|D���ۗTZ�~)��.�7+�=��v����P(�D?���s���Z��ZJ��\N�OƇh�u@��W[���%�K�14y�1bH�*LVR���0�\jF�}��pZW    ����b*�g�VV�8���]f/`�̝0���K{ȵkg�/��r���'��!%I_k_�f�M��UT�u.!�&�{칸U���E�i3���@:����
��SU7]RØ����k�nv�L���)B��%����������?�G���M$�W9V=�m�Z��ܭ!���m��B�P�M��c�%�睚n����t��}�?���K�0�a-���gW=��^<{�}�d+1��6�_@�̬�.����(�]�+ g����5C��&S @���*�@O��;��N�
���=B�0Lmd��tp�*a�J����K�@pv���>ӁN�{x�t�Oi�L@q��6[`v�}tn��e�����K,l���f��	��&bQL���WNm��Sw�{aK�^50FY�b�����z���mS���56.P�v�B�hL
��j�-3b-mEh.ԙ�/�,�Xsr�D��~�����Ev�䥩/���xFZ��PK����������.�����m��d���Ͳ%썦�3�]� ��d��K톙I����t�h4~� �������G'Yl������^'z<������ÙH�Ѩ?89�����q�l�NL��/FX�"`Ƚ5��b�?N蛲�5�@�W��_0�-���8�\���g6a�y������n�D�A��!�˃L�a�%�aZr#	���*߯ )�e�Dl~�KM�"�]w16yu�w�Z!�%\�*����e5��^MT��t����zb���Y�C>� d��MB�*�R�w��l�DOY����&8m���'"�@ʰ��٬Ĩ!������ƹ��F���l�Y�"U�Y��r���U��@�U����J�X�v�9�{Z���D{5�h�%���
F�[a���o����x�Hr�����I��.v�zu��#8��������_U������z��3ݘ;��R�����g8�?l��`��%�&��X.��{��b�Z,�����l� ku���ʉP�^��B��%�K8J��qR��ӕ�w>\D	z�(ι]��櫄N�j5a<��3��� Qw��W�'����xF=z�r2�z�cO���hā�%����gމ����/K:T���0��#��	� �v��v:��_m���RЙV��x��A��z9>��$N,��,K�PeR�J���@�u�ĭr�9�5��Q���2`*V��.�E5,U��������D�����JAwa��(���2�a����c�Z��_P{�m����k�Ȭ��T�w�;�H�-��^�`0�|�#:�� ƅ/�h�9�t�f��e^j^� ���̦�����*q^����������`6#��e��+��E�P��+��GlP���5��Q�:�^�UD
8x[����4�=�hc�XgɊ�^��G�	H��76��r���1ĩ���=�km풷��jc�����Bb�z�3��ۊv����ƶݙ�)�̳)��tޕŴ�A�׽V=�O3�w�|4���%�fk?�R���7�l��p�b'����p����������ky7��� ��Ι�a(�N6�a�j��k �T"n�����q�v�����징���b�;fu�-q ���:ǈ�ky�PX��!m��D��]&QJ_�����ŗ�@v]| �O�� ��#uAq�s�<���`��L���%����?��|@m
���r^.��p�\�+�5S��� ���@�'˙leb��9�i��P�4m,(G1>�D7����:��L������k�4qֈB�1It�Gٿ%���>�l��#aa�8T?����c�d�L�}k<:: ����i�,�l9�OI��T�Q�No��)SU�xTz�m�+�5���$���EY�H��om�MhW1�����>\M��N%��(/k*r_����-K.3DzҐ���2���$��S��?��P1�K���`����������{#�֖B�OFCD�·���j3)��������xm�/H���Ӯ�
p��]1o���u��'�3?�ڲ��	!�mef��
=Y���J`<���]T4�L�e���2�JK�@{�9�-�{�S�#�ő`�U'�-�j�M=Y��k�b��G�<z�c��2��m��O~�����({	����oU�����.l?�n
t8�n,�0�F���j�mh^���/毀&�m��o;���ax��F�x��&�
��#W����i��j=�ն-B�~��-��>�@~��.D�Dz��p��vY�+��TڱL�}�9PQ�}]R��g����s�6��ig�9��B!f�ej׳��M��'�)P��%ul��|/#2� �av��H�4 ��<�_��<�'1/���X�&�s�u];�?��NOG���+�ߔ=�FYCM�f	ʱėD�Z����k�8k�c$R����wg�M��a���^��.b�Z&d�ڗ� (o�vX{��2(ߑ�@垐�҈�}(�P���<1�y̡3�Gő���JAd��&�x�mNCrԛ����q}����h����Ʋ�)�!��Ք�ʦ��n+��~�Y�X��W@/�E��.�v
5!�X����Sʊ�Bu
d|&9�%�B���*&���B��>���p��K�,>W㐩�$������aF\<*��/�$B[xE��B�1Ӥ�����9��Y�k��� >��u"k�U`	:�e]oW�߹쨩�����*g��*�{�kd���j
J�^��4 ޡ�`?��:�3K��󰉅P�($&yT(5(�Ǝ$�er���!V�la"΄����P�sJۃ`�ݛ�"jj�݅�/�E�)t2bm˧g��H���~m���^$��Q�>4�iW��&#�Ǝ,9�����BW��|ԑ�_ɰ	_��7CЛu.�_�]�Hz����J ������(�Vŏ?2�hy���%!�u�����}�O�\N�Ⅰ~��D��ǈ~RE_�UUp�{7ߨ�G�����E��4L�97X�wE�Qh�H*�]�ʰ&`K�+w���mD!����f�q�hzڤ���ɼҴo�f�*��6��)�Ѿ������d|V-(��_�g�L��H�&�vU�0��a�����˞�5A�m	�Wŏ6~9ٮvm��l���o�%��#*�x]���ґ��ѡ�Ã��{)#��P�y������|���#���a�l0�p�,��6� ��Q�L{��B��x��[nK�;&�$��� ���º#h|�+��������p;�A&P�� f�~�G�υ,1Q�G��A�*G�ɔ��UJ.S�h��ZqW�?Z-�TZ
.�Z�a����¦r�ƿ���Kcex�u��s�+[��_���Yˌ��u�����M[H3R|Dw���|�g��V�c@��~],�9�1_�/��P��,�Ň�ӣ�m^6��e���ƿ 1�jWD|�N\�b���	Tlıveo.������ķ������*�Ż��M�gr!OBv8-|F�?���9pg�0J!L�me/����6{u�3���.�Q��sbˁA��� �lV�@㵛yz�7���S!&ƹ���������?^e���ն��ND�����;n�����8&��Ҭ0�z���W%��wh`�� ���/�3c�G��S��e΂*=��'b�=&�@���h�y�T�;Ƨ'�R�S�ҋͧy�r��Ҕ���}�3'\]�F�|�4��k�{��ܷ��8��me���bR`b���������;h-�@R� ��6�'����֢��
f?j���ZK�1��q�T,;�a8��V'�9,H�H4g��M��,�b�s
̭?��/�B�����²���	�h�F���~�d15��R��o�E�+��={Ϋ�{�:�a���P�X�lU�'�~���� A�Z�}�֞l0{N|�[����2|�(��$�Z����h���Y&�Wm����^�	,�I��!Ȉn��F�b��a/��$_ ���04P�䉑��0s)�,�'9��^�:���� �\�U���<��d�u���O3��$���YE��O¯���=��4����*��Ab8��kYN�    �����}�Pѵ���c/�ƴ��w�R_��MV'�n|�m�}�e�N��SGF�]�ڪU�
f�����P��u�O�GnJ�������,�͵�ش�␨
��t�"=�㨘��刮`�����wH�HB�s7²#����_9����@��fe����]���C��$}��[��ؽz	�k`'2���pYJ6[��3Ms�1(���]��u7�1�(�tэ��hGi�vD9R��Q�2�e��J���@|l	����~Q�cp�5$%�e�Ff?v�[E7�r�%��4�����l��#F'*���2��A���aD�hVq��7���L����o�ϥ��v}���c�ll�Aw��l�׽�TA�mE�0,�����h,��n˧��:��
#ˬy���[�����2ۭ�͟P���I�������������_�.ݍ��un�D���$��y�\"�$�`���VG��V��B6�W�;�9�P/2�eO�0v��.�P$����ֈ���yrس���F���*�Q�3�ӡŹ+I�؝+H��(��Y�s��T��w3/E0,%|�F��m\(�!���s��y|#��]���0N&<�{
,�(%VM��K�⧠����h�xrv��.�ԀEK>ES��v(�Q�+rk��q�AթrM"�=e�}D!�h6��̨H�
x�	4 �4tx��=��.7��������[����H?p�%{�M��Ѡ-��4#���X3��������2��F�2�@3#{����O�laW�qW4掛���1�6��Ƌ���3�O�Ã;�-�`�����fhy�v��@ǲ���Zr�%��I �ūb�B
�]Ũ�>s�kSu������|�ݥ�2� P��I�-Js2�|>ϩ�r�}1��@v=c�������.-,]����c�ؙS���x��6I���I����)��cIa0v�W�1��T��u�x(�]#;QTU#�{��a0��\�7��\N�
`m˥��§��U~�R����@�3�>i�!�d��S9>N;{OJ��(t^����뾄����(�R�1� �{�VAx&��W~������*ck���"�e"�R[�3�,���[���,��!P�s% ��\�ҕ����_iK`
Ld�������� �6�-�hde���80�k�2-��Py>$����;���o����N��h���G�v�`�0�i,��B�b{�Y2g��C�)uf\{J�М��Ur�i7C��5j��	�*���
��G �� �\����H�/�����	��%쳂T�4�E^Y��SB0M��n��Uڳ�B�����ol3��Aogp_��)b��!�+�Z.m��M��d8�~I�N��}eh>�k�;2���H8��]�iL�;�H�Z��O�$e��Ó�
�6..���e���asOO�^�ҍc�osS�ռɯ6����k1���I(�C��J���SͰ�\'��1�P�)������]�4�uh-�C���Z�	�Ϧf]�J�|ssCV�u�ƒ���>q�6jR�(�^��7�B潋��ՅU��L�"������i��3����1H���hN��(/�!K�&�ȡ�1��0%�jN�O�Fl�S]Ѭ�o2�^��|��J
�f�b��}D���BJ@���;o�"�:��X����6-�X���d�x`jF�� ���$���n* ��{�%����`�B�b����S�Y�ʽ)��҉5S�����8k,��!)BG�!^+��aFó!.�0�&�yMli��׳"�b`��S�g�a��h�'�>/T	�Ei�RP�q�aÑM�D���[��\����:!�X>*��v��Kth ��T6��i#O>˵��0��w�%�K���v9Z�4�")��|�y��E��n�C���Ol�;�j���b#�O�G謾\\m�n��\�4D����Bdw��(w�h�� �<���I-BXw�<nn���	H次He��0��F����!|4{K� �:�b�y�������x�+���m>�t�rr��Z�OA��&�W�e�Eȶ��l�����������]FU�u�z�(��e�M�V7i
\k�v��E��n5���|^�\�����7w�4*�M� �?�����IT~�@Am�z��wu7d�@Շ(r�
�K���p<>�B��CH��<��'�nZ^��s�������ݷ�ڍ�FS�@5�`�V5���Q�����fʅ����D��Yh����!��p�řo#^�jF�(�p����������e9�Q��h��h����6�BEq[������|)�ȁN����4��\����^@���H0��Ca�M�`�]B��R/K��� h>�뿇h��1Z^�p���v�w��Ej~��ۿ�lO�٘������>�X��@U�p2D�q�Qk�#�QZ��P������r�`1�ݹ�]	b<��ŴյT�&gL��
�x��˦�s��9bu����B4`S��~����|�(f7���pħ�S�uo�'�1|�0�R��|5�]��RA�9wZ��%Ԛꂪ�Ug��G': ,�D�Sa�㏸���&�/B,f�Z��3��d��b(Xxg8�5J� �e��{I!�D�V[��=�l�D�,P��vZL[l��&���}��/�V'��p�����%�x&���j�L�@ō�ȫ������]�^�}����B��e�A5ΩW"J�"��n�t�Ϥ�2c5ձ:%w��f�#4�?>��u|��6[B��}F��V5ߗ|�y����J�8�o�}Gi-��K+��`�|��^!S��4d/�XV������R��d덊��I�~+��K�8i҄���|�%+��d}�:��F&�J�I�b��$D�;y80��s�٫wLhG���]��]���6�Qu4.����%-DQ����\3�V�S-Y�%��RbeI�I]���J%Yi#�k.�]�F}�S�6�QDm�HhA��=B&��7���>���(��n���\�
AO�8��3`�I�_yw:��\"�;E� �R�̦N��x��c�羝�̲8��V���*��2;X���\`m�*���4�I��f;2/.��w@�׍�$EXHJ����w�7�R�;w�I�*=:S�&�.��]ڧ�T>��;�}Yx�"���ΧGϬ!�be��Z���"u1��/(��f��������y�.e���s��_e�o NM����;o��u�B���q@��ȸ��Jw!�O�0P��6B�!��.�gRNx,K�I*�?�Y��������u�MN�-h~���O>�6
R(��сtaTǬ;:<���[o�!)أV|��p�#z-���-�Z�L֩��&Vx��.������ �!n'ϕFI�2����v��Mg�B�E��l��q੆��l	�tS5*^�A���1��cKO�a��N�k�t.��I��*�$��VDiE�3�<\N�T��@r]S�o�L�4?]x޲�r���EZI;
tÝ���%�8����@f2��0�ʖ����)fr��l��P�<lvwp�)���� ����m���":��M���J@������pܷÞ��E%�݃�Ѧ�w1��|�/Q���A �ۍ~����|�?q<��"��|�H�~��⁓��ޠt~a�;7mH}���!~�j�>��qA� ʐENa;��f�s�� �1�6L�S�G����-��V%^g!z �W�k xZzk~Ƙ���L��O�{��<j�n���Y�<$Q����Q��w�� !�5�}��c&=VV�dåU6Zu<�L��Խ˛_v�z�������R���W��o�������?������/[�e�����?X�_k/�	�Vu�m�&�6���G�x*o�nZ,:M=�F�B_���42�]�����z�"����e�۬���͠�'���߁�)���n�p�tKG�t`�;��Σ���r�-���/���v�����h�%��H�f-�+�������8 /�KDH|�T!�Ҵ~]^IU��m��@f�g��|8����l���U5?�<j�5��|6����]�    �q�+\�y�}��:��Ý�1tf�{��i�s�/�*��^5b��v��W�A<�>�l� ���� f;_%}	�P{����gQ;��:G�^��%mh�>����wI���v��P�+%�%`���5�L��'.��� �� �\�E�O^��!J�AK� wsP@p�h��I����Y���c�g�)"]0j�,N�b?/��+n۞��U}ۣZQF���ĪݫCj��B�g�.�UG�S��F�������:U'�gJ�Z�*��1��F`�N��f޼�v�^��{��D���_���ab�?�x��Oz[��\/���&��B�u����_����WUj�F���]J�;n��E�S$�2=��F�a{a�6N�+��s9�H���FX��r�%��w�Q�����m���1�'����9�V�c6�J�3���Kȥ&k�P�r�@˗y7Ik��_^���m�Fx��%\1��m�ٗ��jQ爢��]wnF��ս����'G��b~�}_fj���rz:�<���B�՞f�K��̽dY���-ؔ=�2KC���o`UD�u'�Wy��+hKGa?&�p��d����SQO��p��]��\m�l�ƫW�Z�F-�y��\�!�P�5�)v$'��+���^�s�Yz��jS���Q�O�N~�H�7$y����d�4�[�2Vs��)u���I.�����������Ӵz1On?�������~�_�G�b��c��(�+@��m�����E�XA�(o���۩�E�棄��$c3������U6e�{ <!�e)�#U�k�j�\I��*d��|O�d��|�W�+�+�C�%
�x�R/�P�bӑ~�zmX�d��ܰ�9��j̰>9��� ,��ncÅ�N3b���f�J2O�l�o}&���?���I嚌���������#�7���^�rYn�߲ U�3�F'��z7A��-�KA�-X1���`ɺGLAΈ��߽)�E9�QH]O ���r�^���c?�(�I�Fƀӆ����LM7I@J�Tj����ޝ)=m��-�_-�dd(�T4��[���ZvN2�)����|5o��37�m��Ш���%R/v՞.
�P.�@��sB��c��|"�x���c�{sZ��V��_^{�8K����`?������v��-{�� 6��&��	 k��g.�D��2�y�Ϥ��"k��s����kI>��`��(v/��rG���{�: ̿��tN�n��u�Ž�b�/$���/$!׫��6��$�i�kF�_)B�S`���(⒱���xb��w����l�t�Ii����6�q��։o ���t�&�,I��|��+X;��U�7,���m�z�e ��n���:ߥF84���:�O���%�D8C:e,S"�~�r��Eh����v~����,�de�yY�W��	Ҳ/����#vzA���O� �h���F����#J����7�dÌ����:(_��N�^��dw��;/�,)-�K�����8z��y����@�Y☽���(��V�7g����4v���npV�JeQ��]]��X�v�RGh}�{�b�g�p��� ��;��m`*4z�p#���:d�������U��x騑�N�<T�:���{���Obʣ���b�UP�N1�)4Q�������P�M�]�
�T5����F2p�zP�E� w]�<6�p}߲��,kXpM�V7�\��:aT�BA����d�@=� ��]/D�Ŗ�/1�w8V��R�MˣC��<uh�]1�F�����'uӯz�w��4&:�h���"�y)������`CL'&_(�}���̋�J��h�ԅ���L�'}�y�*G/�����(2eI)h�/�5/���������zh��S
�9�/�6��<I�rj�pl���7�G[O��77Fh���˕��`�%;-gy���>]�x�3
�F��Ku?���3��'�n}��ɑ���������y���V��e��_��:�$GQ.��^�+�+^���c��K������5��<����J���^��y�>Q�z6�Fa�	؟u�P� �	��.fmg�`<��:*����jsS��M�Zl���|�0����	�t|ȬC;�Lv�D��w`�R�P�'�ǳ��w���a���>�ҙ2`�:��̰`YZ�U��9�G�'C[�{����,����'�u t���1I�i�M�p���,lb�Ȯ�d�{�x�c��t`��XՑW�L�1h�k��D>��<��Z�����xp2�������:İRv����7s/!A���0g����x�6��:����aQ�,�[�nx��:��"���^�6�����my5����5{����X�|�����̈́�dԆ�#��1��H�(BB�XeD��[Y`Y��m*���ȡ��'2.��VF���a�U�_���+�]f���c.��4߱	����a��e(Ux��\J�s)y��]*ď�#�Π�-�6��5T%��˳���tN�%��'�Q��C�}���/K3������rh�t��� �����*O�ܔ,J�7	� Dк�L���%�3��F�3'�Y�"k�\u�F,d�6����Kj�"�EF�Jz��S�Dۗ�g��(�jp����H#+��t�v���H*/��p֟簿C�BR��uW�r߄�Z�]m��c��\��M�;#pg
M�,���B��.Ve5�5e�ԟ�\�8�P}�"�ۯ�t�1���+��kH�د���r/������T�hew�_o�_k�}Zm��d�w�O-0,_3dl���)&� fEi+sԉ,>�؅�ľV��6o�J�dT�����y�
Bt'އ⪩͍ڥv�� Ӟ"r�.���&~�tU �KnFx�$�K}.4nm3��;�7"�v�>_+��Q��c�.9�0����߬�n�ȏ���@+c��"�-0��Sm>��7܅�_���K$��Юe)��+%�Y�&s�N�E��KOx�/`����33�A{z
�����&��-+N��atjX.�m�z~h0-*�n��ƨ��^ۆB���9v]�A�� T[�/�%���e��	�>�ϲJ���(�w?�~{ ������2&�+��Ð
9j�R� �Kt���]JBʢy�r� ���'����w2v��^���K?>ֵz�J�����ں��
���}�n��y��o�ť�_����w�!^�W��R5���:.-V��=���;*��>�.6��X�Sن���pxtt�O���2q#�'�W!�Qf&���Y�����bQ� �R~�
�!'{��:>xX����U��h�U�n�gI��ś��Od��ztrz48���r��>�g�{I�7e����hk݋�V��C�J�ՌR�K���RcH+��h����Y�sw��]W��VD�Ƒ\�HN�ı��F'�h�+�PiJ��8�5J�5�q3�hé�.�.ez)<;�]���1Z� ±�L,���/Y;��7�rDu�M�,��J0��+������f�N�s�ER�:YB���2���y��u3�N+�~�|l��Lr�g-�q�A��|A���TY�J8��~�Aߴ�5�m/���&ӑ_�a䤬p��'��ƈ=&�����[�STu����`���1�~�%��*B���94ruC������P���L�X����#����������7��������?�ۿ�w����E���76Y�_=��a��Fˍ%(����_����U�������?���_��{V��<��\5���fS����?�SK�_�;{�����������2���s��o2�S5qc�=�wPꐔ�03�����J�]Y�?g���/��w�{���2>��P�"i�[4�]%���b�zc߸�\T�1v��H�.8�Ah�1�g��p_�l�5�����ѡ��)�L����U��F�P-�+WO����WP�N�e]����]v�]�R�c�'�T��&z��7 IfPBUe��e�H�ݞM���j*J�ͨ+2���I��I.���Y�R�(�V9���XQ��    _�o�zC�vA7��y�}���B@��w��6O��ϻ�"��F����1P4'vDw���n�¼�w4����`�ڟ<^�o6%���`��5����:z%���xj�.E�6��d���g�����?W��`�k���a���=���*k}6(��6K�'�pw��n�><��}p��x�c�]ڱ�R�G��O�p��\ Q���%�>É�A�F"�-R::�x��K�h��%P�R(��Wj�$R��E(͛ہ.�ptSE)>ڮ���������Bn+%�X�U���5��������t)�M}�ol��D������
'�?�"{�2gh�><@��zѾh��-�;�5"�˿Z���Z�h4B� ��!�����}� ��_��Be	R,�y�{о�H,0Z���y�Y5I�3�e>
so�6��V��n�sڬ���xIq�J�P?~�}/3��u���3f$�G�D4q�߿=�(�S� ]I϶�zĨt]
��̇vqUUk�զ���4�s��5�_�Č��3S���2����T 5G���dBöP�BTW��@�;<Ja����MLt<V�K,�����M��{����V�u��aV.�dz
"�2���H�-������lQ���+��)�BL%�μ��]O7�ӯ�*�Au����$D�%���� -�����Y�_9Y%TR�dm����P;,v�a�v��mtPpx;��n�S����K�l1k��/���T��د<gŉ��c��ζ6n{�0ئާ�̽׻�	*>�A�X�u���G��^�/������s:Ў�~;O�ڝ���M
�:̕7�hWv���p��ގ��J�E�����,������*o��ѥs���Ab!��ټ�A�a2V��)f�R4� i&5���Zx�|� �h�ƾ.խ�Q��2eK"qSaA�M��[�s}�/#\αkʹ���60y˦�
�8�cq-�(h+� �e���VtN�T�}��6������y�k�]����4���܄�<�[�nd�%����2��5[��
�����soJn�r�㛢�%���Sc���:�sr����{��"GS�������1���$�C� ueZ\�)J~�]h��>��m�?d�M��M~nc����9r�������C���=DX4\�׿�l/;���ڒ�ɭ�p˕f��9��S2j�U^|��BOlZ�D3���C#���W�-H��uD:9;���ғ��An_{���Ú��f�=Zt�~׋"�'���j@�THJ���R�K��$]����T5zz�{ЃCVM7���+H/�o��r�f�xl�'���|��j�{�����4�q�.��vQ���V�w��(����T�ݱei�����A�t�S���_�U�@ �&ŋ��:n�\��Z�7%�4�\2T7U@��(��q7
�s�J��:���'|�>���/W�O�Y�a�����.vASBY���~�6��'���\ݔr�c�f?��J�u�6��7rZ:���"����%�ɼ�<��)��ήs�$!��-b�o�d�0��sBh3�:�=5c�O���i��q �$�w_*%Qڻa����[�����g.�(#�'+}�[���?���^���pqMb":�y������?;����@�p(��uֻm���'#K��V0兕��;����nr ��a���2��ɳ9��-�x���QV!-���ߜ�L��'���0�~�]��]��+ �����T݈,T2��-�ޤj���y�0�QB��bέ~�U��-�J�җA;��TUJsΎ1�R��n�Ho9��HA,��.���2
�)2$z|#k����\宲:���-v߰�y�m�;���Ԝ^��]逸34h�ķD-xtbS��EK<���~��3,ekp�ٺ/۲�bse�K0:������P�9(\�����k�i<w�CDP�x�m�rQ��	ɷ9��D�s��q��f�!�p|�k�{�གN/�k��C� [ܕ����v�edK���U�=�u&�F˛@�<���9��c��_��^.�e�C_���޲:�����v�t�y�}]g172cS���q��J-2��xzc���Դ�z��7Oξ�������ߟ=�S*w��z���*�B�6벹4��-K��.E����#��&q�z�m�?�Ո!�Z�6��@�L���A9l��5��,�42k󳽾�}QyŹ��ih���Mzl��ٚ�Я��с��*zJ�- ϰyt���H���Qvx�G��[�'���a}�Խ��qG]7�d��l����m�X��²M�Ƚ��%e�w
��$����ךrn]�I������'r�«���mY�پ_bFB�=�ڥZ6�вt�oQ�X��#2�T�A�կ��e��ʥE�z���7�����HaNa���J������N���%$�0���ܬ�y@C��u�'ݵ���tܑkh[�vʵ� m��U��������9�dp�h\�T�g�����輣���W.v�?F�'�!N��8�lU
���2��������?�?�jB���b�-=���)e���/�`"׽�����ڵԥ��M�y�:�q�z���̂%�[n/H���.;7�:�����$�:U�c�\�J�����B�P�dI�(�G���K{����9��p=EB>�O������m�-LĮ��V��2�"�u7�dOk�Tx�}���~y�����6d��v�'v�kSp����ƕ �c�z��h�Z��E1�@6.��+|�s�#A��R8�t^"6�l��Ҿh��q�n�;9N����qg/}�^�L�o�Aŷ[Ա�����
R�7���{��D]
�o�4�rL\G冦�Q���+k��-��"���O_�<���U2��o{.	�@)�=D��'U�Х�3��s��;P����o���D'���W�� OYY�`6T��5�*vb'�����,A�T�9�jR��i,ϐ�X�~����w6�tR(�De�:&Z�Y�f�lW�61��B�����f_�P��V���!ˎ~�����5��|�k������	��XMZq�]��@�z��o':�����H�E��F�s]Ti�֛�g�uj�"�)�L1���I��*aCj�N�Y���蔼oY;z��X�om�+�ni�%sO�D�0�E��*�t)����0yE�r ��̃�fђ�e����3�E�;�Ci�5SM����'f�7p�7Y��G8e��!v���5a���&Rٶ�r�,�rD�N˃y��\�Pi��\%�܋�U�&�D Ԝm�:�Z�P N���r;�t�j��:Ǎ�rc��r����y&K�=�F��\���Z��vC� �|�s�9⍕�ES���q�_7m�糖��K�v�"0؞cS;�6z��  UiJ͆�Z��������h-�G�+`4qU�<ͯ��㩸`*���E�'�*@"P;rZ	uKb�>)��qQ���I�Ӧ�-��S�q��h�1��g7�[�1�;ր��{�0�EZk�Kt��+_�V�8w�l�G�a	�:sXq� "њ��i�Ʉ��}��R�H��+s,(j3�y^Q��LZ@��>��-$m ��2�a��	°|��6Egp*э�@*>�<���Vu
(��SAת�d���?���ΕC�lɶ�l��&�@ +��n���i�ht:�(.�D� qH��t�̰�Gʚ��H+���ǵc�����>W�o��w�ZE�^Bm}�h����O�g���å4�:ApFF��S�@���?=y&�����\ݳ��L'diI�]?�\����v�,�8���d��`�E�a��!�y�TC�
��e���k�Z�r���:ܴ����KE_y��W�I�����u3l��3Y+��M(�v>����߱YS8��b`_���=D����k���
�R���ϝ}Ԉ��lrE��9�
��,��Zq@��/�,�(*�Y�+b[�W~����}>�gJ&��z�`�h�婖�W��@�O�N��dEI5��"���ٍW�ˈ�m�`�i�{� E
  K�vm?+V{iU�]�vе�Ղ���b�Aܮ��/0Bi����甦c�4P��\���,������N���V�8�vr�Q�V w�/e�N����L��'���=Ks�$M\���}6}\��<�K�㛃��S.]�zxp�޺ܩ_����p����l��&��P ��9�76���'��eQ�`��rA��=dŦ�2_�y8:���\2��k0�'P����D��D�tr8��P�J��
�=�UPW�h�a��g�0s>M���&����~#Y�|?d �@��	��6k�\l�Jq�T߿.��c�Nt1��<����ҍP���BP	���l�{8���ف>_��t����A&�e�᳻��o� s�xoށ�%8J�M�e�7*���%��F�u��B�'�B���t�\�t����zN�G<�ˈ��CxUڍ.Kl
2���i��`r6K<$.��]���=��-v|9
������~���@��cp��:��$otAŻxe���B�fɼ�����x��e��~����:���6�Ƚ;����>K+)�L��`"������ o�ſ�ņ]�^ ����� t��v 깫<�{�O�(U�� �n ~.����<}�P�[ 9�`�B�d����p��C����:rm�'����-]\z�K���@{�n*�S�q� \�R�ðti
],�%�
l�geFbH��!Eg��^u?�u�f�v�s�\d%ݹ�^�&�]\D������3�J�?yh
���_�0��}�׮-�!J8����<��������I��v�lU;�7����Kw+~�t|����I��px|tt�9o�)�H��b�p1��.�+�"��=��E��J�vD�nD�lAmZJĒ�:Q7H��ԣ��l�1%����$�_��cK�N��0f�O`5,�@�s�3�p����.���+���R#>R*�銙�l����)�,-.�8���C�DWw���,I��-d^�7�D�]"�Vw�Ie�����)����P��㕇�De7���[�iW����WE\&��AI�4����-4�u�PRҏ{��S!O �)gC�m�c{!c۸��WT������)�n��w��xO��� z����j�֪�
.=e}�2	�w�hmZ������_�EE&�]V�%�!�|,���,��-?�E�U�l���W��4�x cKu�HM�e�iI����|3�aY'�K�l�y�C���9/
�V;l�u�}^I�	�����z�W�}�HQ��BWʻ�7̮�X���Q��fc�������g[~F�J��֫x�%L�<�k�A_@��O�+ԁQ������K^($��D\�q�Z��8���Ǿ�p�Ha��C�a�uڋuU��{�O��*�O1q���|]9���=>�"c��e*F�������uq�����vX+�ٲ��S�3ti(�z�B.�M4���x�(�Q&�؃3��^)ӟ�%�K����N����<@Z�V���֭ �9�Q��zq,���dE�|6)ꙫ�:�/�\Yc{I�ʍ�ҭF�t������;�+��9�H8��L�o�¶;.�����	��Ek��F��>c�i�o���̂�a�j�/�;�oJdZM���@�iͽ�n/ ���اP����EC~�Zrq�y����-�Z@�X�/�u6!�d2����}���T�����w�7�7�5v6��q#"i!$��P ��$?P�]�?R�K$+�E��*��B�=5�R�l�����+b�pp�TIfp沺-�e��>(kW1Q%?Eab��d�fǚ�y�ow�'oX?\mVUdj�K�����¾�?5BV�9g㟬B�-�]��7��	��:̉�6��xm�Sx�"t����z�̘Y��T�n��	�]k��#F�tUI�$3q�q��Gv�P�m��by|l)�p�9���������w�\ DG�<p2Kk���o$C��x<��o�l�gvt5R��LG#4xt�p�V�u���[���w�B�T�F�v.��n��`��YM�n��Z�k��N��mCf}.�M�|c/^����Tl�-��`ڲ%T[�A��ۯ�Q�<Szw�vڶ���F,B�k#i��N��%��>JVE�>�7o�`�^�O��5�	O3;3ɚ��d���?���`�V��<�t��|��ۇw���S5z��U�ĭ�ƈ�����^�OLgl֮lqrD��Zj���t��F~���� �'O�m��$�o��������tbae}�M�L~���=��� +�\��)�ȗ����,�L�&d��K�[T���A|�9�1���m˻t�_�Rc�7���ks��b�M��/>�8��T��^E} lk�Em�/�wCYe�юY�������ᗴ�xB��P|�˭��ٕ/����f+N��$����p`S���w�����+����!|g��Gn)�dkw?�Zt��&����~؋�s��������M�m�[8��8�2��e{���k�h����;A��I�^"Q8�EY�X�B��&�������8��O��e��g���U� m�0��w#��b�s����b��8��=�ч��nO5{���w0�]�g����~����'�      �      x���ٹ���,��iE9P�#���h�;� �����:/;�ϔ(3�����G�ȿ!�+�O��R�/��2ʨ��������W>%~b*���o����'��R���_%K������G�؟�W�?!��/��X�D����ϟ�?Q��������+寥���P��P 忬k����Ol����_	�}	�e�+���&�� <�)����������~F��1�LWN�����_��5)�74�w(a����/�<b��n�O^�C�L_9F})}뿚s�k;���go�;��I����[_�`}�~�кa���z��ˇ���C�O
�Σ��'ѽ�1�����c����J9����ӓ��yT���tl���0D��>�1� }�?MOQ�{�gR����p6'��%t{������?�����ӕc�	}�����ᣤ��C�/�o(c�A�7���%ݡ�g"�16�g��Ϣ��Ŝ�Hߘ?I�KK��?�`�-H�nH�34x^�n�q��ڂ�G)<�}]����b���s�o-�ܽ�`;�^��!rg����S��{�p1�L����>z��^jݔ��G{��"'��Q�죬_�2���ӱ7����qz:����(��z�I|����^����������s{u�+�_�>ֿWK�@*BU���I�OZ�E��gK�n��^L=�*��_�@�P,O��%Af����D~�V��SᬏV�rn&�e	�b;E1�G7�%����Ϙc8Z��p�~(�RA%�:������$Uh��%E���YPicI�Lq&zi���e�^6�#}�l�;�ZEh���u�Ng�����j[�㿠��������Do��r_�9�򕢇C5�;�c
��C�H�ߧw��+��I�K��tC�'�G\]��q]�͆�(���#6�G��뫻�T�PB���.*"�؛e�q�����T��Cݟ!<t�eR����z_�a��qd���~��׊�#�U��Hϻn�j�4J��R3�'k�J�!�C�_����2������k���L9���?A�tQmU�>zm�k*~�n��}��9���s�q?}�j��i�y�=�D�j����7��+;N �b�ӯ%1}�ޭ�����Nu�v��L���%J���� ��* �
EU7zD��8ms�?����,Y��]>�����͂+XsR�{�'�jN�U��	)�����c!Sr;��G�t���� ;U���ӵ�i���6Z�9B��|�
 �{Я"R�W��|��N[X�G����5��G�gU��j}������jU�3�to(�����J\����+?��]�(��W��N��Wg�_<���|U~���"%��QPc��e���}��~!3^M5����b���P�g] 8U����r�M�}��
���I%^����8�Y�G���`&�<u�Jh������"��L3Y���"�7z�TJS���8�WHh�G<u������*�o��jʆ�z^>^�[?A��|k�R[N�r�U��R_Z?vF�L-��9*7��{��'˚���l,\�/�䳧�a���W��ʼ��T5���]�a	�@G��fj5g��FH�6P4�Af���QsF�KUE�bO�\��,�Ձjj{�#���@�l*�����ϬP�o�j�m �y2.�����5�`Ӊ>蒒0���	�H�o�KY=`Q��&A����u���S��տR���9�d�(���#�����Z�A���b�_U��]S<�E�C"��s���g(î�c�pj����ꝃ�Q���j����y>���@c^�\�t���o�+�`4.[X�h^��򼎜����q-0�U�������a��1����+�N��>�1ݦ��!�1�u��.ѡ����Vg��h�>j��9[*��JO���6Z���}��p�?X�/P��1ԽQϞ|��UȨ���>���%�RR�t� <�/��t9�wB�)uF�j+���|���#P!��Y�>8Dm�A��%s�_���K��}��f��U_�4��R���_wuO��[���jAݢ~�hz�h!� U���JEX��:/��1������7\�;j�6qQD�]��Z��<�z��D����U�2j�'؇��u�2��V��'%�������r�k�:Ԇ���^!8Ղc�g�F=�qݴ�Q����MoZS�Џ�^_��c�(�'�����ƖE6}��R_����J���z�c��Q�m��������*��E�F(s��VB��xR���xX��g��\���y�����<�����_V/<-���*`$l�y�a�%�lD�/�Ԑ�DZ#�H�P@���Ӣ��S���zվj�5a���+) kS=~D��ho�� ���B署�j�O>0ĩRyTX����hp�+��jXԔ�tG�!���#�3Dq!�tߎ��٤�i�a���ۆ���ЗV��y����\��K���X�b(��Đ�*��<��Uh��T�о��^�����m27[�ex��<�Ԑ������ׯG�C�d�[����?B�W��EQ�*%ԯ~%80���=B�F�ՠ���$�j�'��W���G���3zx���=��z�ǆ,���LQ�[V�s�OM�?%���ԏ��FM�|��/�sP4�v�4����aq�֝&H7K��ӂ����gÉ�X��2s�Qz���z�U�b�K�ӈ,�'1D}��y��p��ťt	���_�z �/�?�g�s� �� �o����a	���	}~'��UŨ��-�>��4��bHVQ�����p�x"2~�k��B�g:�6>C�}�i��RWјdįs]�eC�֊#�RJ�Z�ǻ��}�f�3ѳmm��?���o;bOBN���o(�WȢ�j� �ޥ��ի�7���� �V*�$7���;�)>:zT�#�~T��\�K��.W�w�"�w���Tp����W��K�"�}�W�s�D���~ /�'�9���j3'1�*�sM�=C�ǿ�r������>���m��S)���l���y�,�,��R%�?kJ�9��B��5�ZhuG|�x��M�k��'����ڰ�TG:u@��bB*�kw�7� ���g�U����\'��Am�S: q�m-��!�zzE�{5>e��1�R��2����;_ ��Ba��hQg�q:������|��[���٠�^wӵ'������ǥ�L@�qC�_!K�#��FVg�ҧ'
h�[REXb�2�����G-���.GL:�6o�K|�P� 8�zV{�G�v��X��1W�P�%��򵄮�Q�2z^�Q���j��P��/���N�Q�*�����opw\Z�2���:����@+�@�-�x��2�M��նV=�|�t����<�&3y��t���M�A��͒N-�̌���"<��<�x��B��A���W(Є�PDBjd��m	���.,H���OPZt���T�~!�`���@��wE�PM���X~��T��.z����_c<�|Z[�!�����F,~� �J
8"�Yx�j>t�q�fƶ��G���\�߷l�g�rL�l�β52 λ��1�烆�q4�<!VixՖ� fQ�qj1K���	j@���R�A����+������1���$�����rU�����V�%�S�VhL��o�2��@{�,�3Qy��L���1�cnTPD�z���3�� ٝ�FGI�ZUO�pz����;�1�T�������қQTF�u
�u��)�����4}��
���߫|�lna?n�`n�v�_���5o�'�d�-��
�3����,v}�	�ZS]/�>eF����wQ��\��b_�v
�Lۆ���Զ�f���R
SR,� ��G�H���(�oB��Է�Mo3EE���)¢�*��8�� ϗX~��x>�t��f=-q'���q�����Ix�W��^^i?!S�4�|�˪Eo���3V(�ʠ�zq��<#���%��%%,�i��c�fɨI�-g)��~�����EԂQY0��    �x���YQU�է^�j�!x�t�� U�-�_����φ���嚪ԐvNx�� �!n�I��T�i/ vJ����r�r�ja� 5�����i�	�A��钜����*���͸CfL�:W�t��%���Vx��k�M-����^�)����;Tf`/�s҃�'�s@n-W�R�°t#גv!PY��O�U����tR�=Q��s�,R�	X�U/������	J�_Y��:'E�trq0
��Tj�#��2�A��P��zC���[�V�T6�$qU.�XW�BϮj����o�^�u�JqC��A��"�l�"��kh�<\z��T�
��	��:�(��?kTX�R[��+����YZF�Y0"z����
zޑ��)7���^#�2�	��g�6���N��W(�Y��~$��Ub�׋}ʇ�*hdz������j�|7w��q���0P����ZG�o�崥�U�<B�2J閔�BP�Fcr�re���������7��m:#L�FL׎L��ca�X�������1�%� �b���#.� 3��ZL�1;�U�!�o�a��砗W0޹���XP��X��x�ߠ܇ZD��􁝇��h���ڸ:׿P��!�X�xhx-EGG��-�K/�C�"+�����cx��t.��S����flH�F������I���G���P�O�#���P��gX?�
�r2q�r���V+P���(t����]g�iJ�`f�m?Bq7�-PI���F�};��tV�����R��7H��PJ
o?Ǫg��*���7����	�������c8H����˽��n�����ι~�*!��9S����R=�G�X,�*�
k�Ybz��2(X}�#�~�7��X�'�d�Hb�-�؆K~�Ğ��¾�uV���4�,����\b������GU+����#�=ʦ6d�|u��#L8�Ym��]���l�r�yf. ����ϛߡi�u����DTT��I�+9�[��EQ��2��jU��ܪ�̛}�@���n��%��+Y7S�"��XR�$@C��a�Q�=8��o���A��fA6�Wƿ��b�]4s��5@ⲩ��Uޢ>J�C8y�h�g-��`%X��{@��@���>����jV��V��+�A�g,J�����?��=ej����ٌ0�qXϦ2��Ќ�<Ap1�@��ҵ�hjW�cW����Y\��=Cm��2HF������)±�)���ma��c�mϐ�õ�JR��
�9*pPN�˚#�����`uv�] 4�a�P�h�
/gT�k7�Kt�`��3���3>_�����^ ���Ru����?>�X�	>���/�\�Q1�B����T�����yvK�O�T@:����
Y�Gb� ��V�i����V��͔u�G���¶v��x��*E�Y���v�#Tg@&d�SG�a_�'�ߵ�~���t���UU��*/P��n(`5k��kX�J;�j��Hz��B}�p�~���m�4�AP��m-H@Itv�5��y��k���1օ�4ZS��U*��E4���o�x���I�X��d��H��3�>@¯7VE�����\M�����Kܩ"fa�1���?�P� �WH��t������F�E}�"��3<Q�� (6˨�3ԭ�,1h�SXEC0������}bs&�Y�i��5���Lg��cA"�E�����v����L�뽶| �O��^����g#j��2���o���`]E��o� 9�>edb=amF�K8�tV�WHq)�U{��3�/42����y�����+7c2ĺPPz.=�c|XG�����>���"Z��"���_�k�ě���z-M���Z�v��Z>!��%�h�l]=e|�nA��.��%=�zVS=��z���@w�X�t+�}Xٰ�q�Y}6�#���p���mX�����j�%Ӓ0�gh^tE�*��Sԥ#\Ӵ��q*ǜ�<��g��Kf�YGPHWFHSo��R���z6F�ǎc^���}I���XX���s���d��('�`��Yg��r�0`�}(E��^�3���x��(m���56�4��`���X�ǛV;��d'�M'�B<	�ː��U�eV�  �u�Y��� ^b�Z����6&�]�̾��n�(.�m!�������Jt�䃖zT�u�������{笞��=`|�rĐ)P����m/���Bx>4��g�C�W9�:~�>@+󛪣吻�wV�s#�B�d葎��x��*������.��ץg������t S��Pdx��w�,A��Ŕ�3J�W���Nh�����;$$7@��Zw	}�QU�,n��[����TKW>@a����Z_�0����#>�`��C����YQڭC��!WX)Έ���R����ţ��� ���S��z�a��1}�*�o�J�;4�l\����6A݂�99�Ԉ0�kqiu�ک���Ѭ+EA�\�@յc?�*�fч��H\������3��X��V���w҂����]��-���]Q%['�li�Ph�(�E5��2�+v�8�8��zW��������[�^cJ7"y�|@��Cyu�wuNk�	�'X��@��K�{i���xy�$���02wU�<C�fYhY4�T�`�O�����=�j���-��n�VX�<Y�ݦ�Q���'��+��~ѳq:��C��Yؠ�!���>aϓkaNLΫ���u����l�g�R7�{Vɖ�ƪK�ͧ�/��,fGs:.�8]2�!�#�a%�V�+)�,2-]�gS$��ꆄ��ɯ�B��pT�#�_01���l8�rey��*ua�<Տ0͒1q��̀c0HS�.Sn�O�R&�fn���CT{��l��Y�dD��
x�Y����Ľ޼�p�̢�?��gx�OǛԏ]m����q�o-_�q��<�̮4��I��c��x�v�����˨��PY�q�mw���Ͳx���>�"J ����е����l3�(�(���Z��U�UU>����Ϸ:vT�QQ�=��V{�,(2hy���T>��	�Ѕ�Msn���ű��C�9E0=G���z 3G^�4}�J$�f�ʨ2W͑���r��j�H9+���L���e�W5��ݿ����8}�=�P���86���Y�jy�!ݖΐr�Z��.8Q�w�w�ܔ�m-h���C�ֱ+J5O�+�����E�﨓׻
��0]�N��Zur�����U������C�)\9�\�ڎu�,Dm�~�}iz�E��d�J�緲��`�l�ꌵ�Y�K�M !H�Ao�b��"[>bb�	Z��v�W�Z�a~��\:܅@ΐ�aZ;Z�j�m���7�vPQ��ۭB]L��z�,Tr�,����X�96�y���\ƚ�2 {˱0�Z�����Z�	[X��|��(ЫBŘ/1�7Ș���:ꍤ�m�k�ݮR�&�n]*�������C"I���d�K�t��uFT8���Ƒ�^!�&FxB�(���)'s�h��z���7��?Cc	R�ED�./��Ҏ��� ,u�ȹ�;������5�Iɠ���Jge-�[���w[=��e����p'�_�b;�|�m���2ԪA��Hp17d���zT���JVeFqz��
�34{R�0��P��>Od�w�U�n]�%ж�� ���!d����Dq�G�c��br*�u������g����tGt�D���B��^�PS��=���q?���K�9������{?��=�5���8������RU8-;��� �QI��ێ�2��A�������E�M�
�?��l~C�].���9Sx:�*�c H~�LZ�[��{�7*ϛfn7�3��7(s6$�����/b�z��Z�Nd���v�7������j�����jiob��Q\���>C,���T�B�ں`���h6�����d=V����9	VU�(F�2i�7�#^��~�Z��K�J|�V�`�
tH�j�'ɾ��
�y�kc��R��q[3ݓ�/�YI���.�lJ�@\���ƭ/Ӭ��T
�\�!M����u2��`Hc_Tޔ
eҥ2�!V~m4    ���ttn�()�e�MR*y�>RFr��D�r��%x�eXc��i��,�f0�B0M��h���рg ��1�B|�,V�f�Jr�����
����i��b9�m���-#u{��.Ϊ�G��_iuy�{ʺXR���5�Ob�'Ș�Pv����q�Ol4��l�-�9��Q�OƐ��(	��ZF廣H��76��ݱ�C���%�/����������pI'�B8g�cO�g�.��¤X��~�g�C�t�è���_aj�'O�k>F<.��E>Bq>��*��/J��tT���)�U�q�d��b�D�PW��{��#��a�U�t���S�"M�Ĵ���ֱ��I۬�aYp2��t���ɐ=з���M��p{��(�_!�SJs䢢_Ւ��zq�g',*ԹJ.
�>�����&�i`�p)���dϝ
�iE-�/b�0'|��e��-��`�����g�s�4���:���t���N���+Hɒ�#�/DjkqY�Eh$�/��C����v����a~]?� �dЩ+�sSt��3Mt�f�hg1�/��_�wg�zZr���X����B�-\u��2���"�zy���NӐ�o�+���D��Z��3���������y=f�<{��<AV�������W��YB�n>�O3WKm�^��2 ���l�|^�"-�=*����d��C��lh1��x��	jX���0 �ٮ�)D���1g;S�i%�I��b(��fA���das3��U0��Kw."S�(�h(ކ�u�\>]A�m��1#��)9Ȕ�3D.���g�)��*+J҉l����9F/��;�NI�������@v��yd��Q��.��C-���wg�`��� �K��:v���V��%>�qBL��92ըn�/��O�
���T��J(��P�I.�mİFҏ	1��/�I}@����7�wD�a�`�M�c�Bqm����5n%>� �*A<��VaK�>Y��ݿ���d�E��uj�Y6�R�o2�����l�G`#��<8��¸CVm|�('�	���zIx�
���L��q5J<C2�ā#Bb�sI;�ۑ@q�lу��O/쿯//��աVŧ�*	�Ǽ��*$V��q�y7���ٳi��s��&��Wc�;��&E+z�$�׍�u]�>K���TU78�dy��l{A�L'gt�1 J;�m�lsT�&���4�,O�y��6k�[@���q0X�]u�������k}���B�4��uCԎC�ǧ"M�������7�~"
B�2�:�Mr��Dg;�1����W�;D_��_K��|_�:;Jo_��(���|�_(��s -I�G�E�=���?9��lN�n�Q�c*��ϬM&������쒪5�UO�*�+a�/ę��3�A�LJ�x��5=@4p��2�8r�,V!�>�\��(ӜTK���Y� �Z��u֠6��b[;)�������LE�"�7dh��W�6T�A+�%+�
�Y�P ��&{�j�'�Π(<�:���7��/d
s73M>3Y��P��gS<*%{mI:Y ��X$���X�f���g���Dt�"	�᯴�x2l�F:7+�Wh�W,��c�̋DGFV��e�1�m��pzUf�r�;�紈�Zp���V�A\��� �(�Z42�p��'�
�'4	Z�2�[��b�(�Y�i�^���Ji[y�3�X�2�lJ�t���\�|y�8�
D�������\ �y��9g��wlF�у_�f�:��űQ���q��D�Q��W���b>	9�����j�렆>=QX����Ey�lJ���PЌ*�궓d�2і�K��S^ �)2m���0���J¼��xuB��,��'gr����F�.`#z�*�I٤x��|��P>���fN����#Me��^ �Q���$m,����4�]\�7���s�@�*��`ȅ��ټ�h^u-�th�A|��A=9]"L���\jR� K�3��F��X���N�*��F��k��3d��j��bKS����ǔ���-�]��ё=B�ډ�|J3ˬ��d7�*�P����x��V	�G8��I���2��u���|��~!���C�(Sh���󤺐Y��A��Y���3Zf��A��e��P\��${B�$�r��X�/��/Mr=���(N��ٍ��Q�S����:c9-���O�����{��5��{�k�o^�l�]V3+�t�����Z5���)�*���߫δV��ޢq�8�l�{�B��ju�et��%K�&ߟTg�@�z�Ssk�gȨ�|H|Ť�=`���F+r*6�I����+Ĭ��M��P���*ԋ��2��BV���&���p?����<�@ 6��;>�P���<C<����Aqe�}�M�}v�2?u}�]%R�r��xB�O�Ȩ�0O�����
�2R�(��[���Q�&ʤ��P��8KK��I#dbB �(��G7�,P��R8��Ȇ�Y9#w\5�^0d/a+�A��2-��@���ϲh_�U2Y�B�h^TC$8��F���Kew�(LM=C�s*�+��K�g��4>�ܫ�Tl1j�%��X��a��v�lnO�(6R1��	���&���:�vQ�Ȧ� Ov&�TG��E��⬸H#7����svB���{�O�־�RQ[��l�bH�p���U� �>��9��ͯI���.���E�e%n�tX��zhz�[�ɼyP�s���KC&6���A�q2١�D�MR�ロ����f�"c�j�&|1�xc�r���ؒ��{��ln����9�q�|ެ�Ӥ���̊�`��H�0ԫ|.4E6{��7��%�@q~�,�gy,>�^=�X�%�&����v�f�K~����vk;�C�k����Ft�Y��S�UJ�_�@��(ƹI�CP���(Ə�)�����W����\VޤpAg%��Vu�W��=[�3�e���j!5����B��67i{�g�o��Ў(�@��T��a(�uA�n:ln�Sd����vz\qG�����,��	�	=Bm��بEi�O6�c3R�Y�������_�rE�l`��bAl�Wv�:�7΁�'4A�+x���&�;���;",xxM�c����&'�h#d���(��	��!��;��s�����s�I����Ļ��^)g�@%s��h�\�	~!�1��g0F���֮�o�ܐ\c�@\�-Q��Z�l/�6g�a����r���
���tf��Bwh�bК�\�.������κ�[`'����
m'�M]dLF��OBi�.<�j$WVj���o^���h�镙�Rq��~���5�gx�j�����Zy�Қ2ܩ;x��ƃ�{yW%��z�H���?[g��Zi��L�&e��t��9���/�.�kֻG��>Ȏp�X֎��U{�ؑ�@�ژ��^�l��~�^ceU�o�z��e5Xs�V���ڜ���q��0��2�����Hk!+���ê��X[�׺�2Y�)
̢�x��y� �61$�u���_���ﯳ.i+Q�~3�	M�7��4[�E]��'�`�_��QkFn|�8g?�Ru�Z��:H�.�������7��,_����k;����x#���eN��A�,0{*�)���_Pk"V�kK��#�����������
7�:@>�`��a4i���ň��W��`�TnAP����Xmf��1�1<��CyCf�)i�������H$��fM��R�X8�>�f�S(��S��cM�N+J'[IC���͑W�f"v���J����5_~��4���jv�š�@k�G	lt���t���,�G�Ў;�2���g��]"MZ�R9)e6�ɼ���(a!_����|�H\��7�/׫�[�����������J��]�;�|�`cQ��}	������˧���Gh��c�/����.�j�G/8��Gٷ�/�,�-*]�͞��7P8<������3��u3Z��� �$HM�o�2��grd��@�X_2u���@x<!��lr�0;�� Y�.2~��\����8Æ��f*'�k�P�t≜������EnTjۚ    �K�h�v�r�si�͖`@��UY�Ax�6L�X��(�H�_��]�ė�ie��}�&A1�8-u2��kT�W:/���!�3�x�/��q���O�ޫP��`۴�f��B\Æϸ��,����^����W�2}����@z�dP��=�A�g��ʈu����L$�O���z�P}���O���z{���@�ip}��2�Q��O�ހ7,���D��
�)���b(�*�U(GuM��������h4r�rꝨ.V���-ZAF�d ��4/�[�b�?Z���y��#�d��&��#,��}�c���dn�U�z��>��'?a�����TUa޳��e!��U�2u�]�
��B�$!գ�gj���R���ё�E-N��{inW�s���3m���'K�1\
��OX\�X�_(�6����"�f��������Uj�p
P�����!e6댬�X=5�Xy�1m�S܂�֎�-�B1�+1R�&�,r4ѳ|�:[O
[��^0����f��I��ȩ��p��]�`Я��:B�ٹ��e�w���/��R��[�of���{A)�����inEP����,GkG1��@��E�F4b�h��Ta� ��`K�?�}*�Nv\PRU�L����	�Vcď�_��r$�C��G�D�����ɺ�-�#	9�Z�tTSG]vd��I�D6?+G�:�x��e�����;TH�s�TӦ)��Y��	�k����	Lp�Y0#�f7-���KS;��h�:�Ah�v��O��bo����P���'(�:����O��9V�j�q�l6�)1i�su������Nc�=�R"Vf�ƞ�e���ǁ�g������A����V���b%F��rﳈ�ގ�&�w(����;�3l�ܳ�b6z%�mKk��@��)�V0%:�-G��� Er�O�.l	�ϖ�g����T_'5<6-�����-�zx�Q������X	�=�ѵ�i��O_�(q��������5�y1�"Zu���I2��7����
C�c�p$q�/�X3����&m�F,e )� ��1!0�Լt�� \>����ΐ �H��]�w��Ž
�ȺƕsS8n�Q�Ff�����#��-N
"5�ތ������vlۋ� ����#����H6��A�j&�Z�����6�8� ��1t���C�R�0٤cy6�Η���U��
a��"�S�����	�� �qB��I6��"�@|��H��3Y�Q�1U�%eg �'h�e�M�>���w����t�����N=ζq�<B�I�t���T��^�տ��.|���,!>C�d�i��Ŋz�*����2��jX0E:J��
YSraN@Q�E'� ��0�DVH�c:#:�#���ns�J�Y�~Gr�!��W�l�-��{�p��Gh���Ͳ��pu2@ݸG*���E6,䟺��X
7���Y�t��p�1�c�Kb��52�u'&3/
x����)��;du����Ð��w$�xb�8+MQ�1��"]��*(D�{`$�dU�pE�oE��R����[6V���,!�^-�d��zTqW6+��k6�j�1�US��}�҈� v)�U<�9{��@}F3qQ�^�<����tr���X�����!<_P���x��J��o�,�@q���'������ȡfoq��5�k_��%N��P{Y�0�OPZ�#èe�.��	����+(�ݩ����/��n����2��k�SFfY��
��.;�&s� ��<2�y
��5�F��O����T/�$��j�Ph���=9��NB���r�8�X��(e������ș��F��)R*�F��0���ϊB�ͺh	Kz���k�~Ȱ��ը�K�����_(��ĕ5CF��<3�ۣ̫�0�� ��$�g롇��^���
���gt�Ūo�	7�k�}�ӻf��)9���<ǘ����26%��A5�P7g��v�9��&�}9>y��n��T�Y(̹JpQ�E��ʶ^=�h
������DG�D�֬�g��&��瀛r�$#�z�V�`��F�bX����ө-�gLL��Wc�.��0��KM�C���?װ�xԈ������@Cy���+f��0D��z�G[M�8�8�N�A�Ft�3���J3�{J��BW�'k�]�q%�,9��Ğ�W1�T?��{�_|��7�3���-
�2'�ܡ��#Kp�lCE�4&���̹(�^d7�?~���
˄Zjz���Ǳ�[/P`&Pm�]1<��PZ������^u���T7c�F��FU%ن��_��Z�����SV�IB�D�ߠ��)�j���U�.M��䚶��γ�I�p����Tf��N�����E����?u6�0�Z:	%�	�v �G�U�tg��=�L��Qyq��"Ɠ��C�U:�q�tJs�Fm����tN� 3n�v�[E`���� fz���9/��쌋��)Ɋ���� F��wY�DmR���%nTry�v��c�S�]%h�����piZޅ��t�ޮ -�@�L�Qu-HVU];���,}1^�����3�u���P�`	�ua�L&�XZ�G�=s,7��j��g�j��.]�s���)�b��e��@eM�d�:�*�t�ʓ��_ĸ�٬��Hs_,=A��������Xc��k��9/ߖ7���<@�#�g_L%.�جû2�W	�4��~9Ş���P�h����r��K�#��p*�oX}~�����v�$�4[��Q�Z9�9A�c���b��F��˄>)��D���C �OP��G�`�rTe��N��if��C��ytdz���*�5uM��X�С�M��(F,��>7�J�$�F�~c����i�q6�;}5G"e=�wh�Xc����~՜�V8�@k�I�F[��x2y��}�&k#;6�I�2׮P�g4��Ϝ��B��j���Gh�r����D&U�1Hf�j4���n6��Fx�:���q͸B��n\u���+�pF����O�#�Xu��@jM�ֱy���̎n�!���!����G����tS�O��4N�C�+�O_� ++�a
�k�d����;��D"O-�'���4���������6��d�~�HN$�!�X�/�Qr?�KɘzN�ne�>@yR}gsD���xj6�n�bJ֘8՗�T����c1��賫�Y�$<g@�k�,�!:O)>�x�JoG./��"$ܫ)�<����@|>�v�2-�;�-G-��I�4�@\���+;�Pg��R2/lh�՟�@��"�2�,�;�9��`�f3�4������/��?:G�J2kn0bENf�x�~�����l���'�� q9�8i%N	���t��x6�3_�L��V)�x�y��U�P�j����ډRn��R�a�e���l ���8��T�����k#R�!����x��L���W)���jqa|K�(8��l�g��#���).P(�X`�z�.�ΉPY�Y�u�D��n�{:m$��la����#dM��1;��=ퟕ ���u3*&�\c���N��UW�#�J�{��pp02�Gq#~c�A�P;W��f��泤>NH�.׈𽹡%��C��YOF�s�,�ngt	i��R�`��鳰����*�o/q$����3Y(�ݦ"�LJ��(!��I�f)�(ZIt�F��լe�_��+�$(&SR�W�.Ft�D��J8���#̮��(��{����j0�bB���ǲXM�j���X��#�<����X�1��G�N7ۜ�!�_��3T'�o&kq��Z��[:���.d��8N�ҺW�4+��F�B�T��l�6��ģ�pKp*-�@u�@dF���4�1�n�ˁ�b��ա$���p�+�)u�5��3"*��a[_�1��1B�=d�8��	�:onBB\�]O�9�YG��Z:_P{��(����czLF9_,��W�����3�XT,]��ۍ>�
�ReB��n��pc�mx����Hq���1��Ñ����#�]���O���.g��x�b�ݤ���+?պԇ�D�YDJ�ѻ�ЦE�/w�J�]+)��    ������c��>� 3IGa���Ks�tv�c=��qg�ؤlR�3�&�\�(�k�,g_&V���A�3�|�k~��Sj�W�y<�}Y�V�_���zٮ;��`��a5yuOP&��>փH�=b�>�Q��	JkXA ;V6^ =*����8Y���:�P�q���� v���@���}Ut>ܟ!��3�}�E\P�v��J2��@����� �Y�d�̭�ƨ|�D��I��͊��A�����º������)�3��*Pu�����z��F�R�1�5̜�ڎ�b���ҬƳ@�<U�M�<�3�\��0���!D0l�ڌ�h��g�.hpP��-�k�U��&�I���Sv��� �;���L�0땊M
⺶��+�N�w�B����_T����Q�v���`��i������%t�oWnѕ!Ȩ���N��P��%Y��~�ҝ4��xn�`���tRZ�'���|6l'���Y
���@��Ȇo�=�S�j�3O�!}� uN����f	�kQ���R֕�[�+D U�j�~/��~�h�Y�A�y��D�9����9#U��W0���uWr9��Hﳰq:�A..q(/�s����mH�]���L9�U�o0�ŶG	�,Y�#�L���K-#^]DO�ڳ�����u��x� �dZ���,q�1��/��́|�7zJ����@����ϔ�u��Y��VNfļA�q 2ᴨ{�j
}<�4g��4G�g�W�ħ1�+��QL�?'�ʐb�}3���Gh�����}ֵI��≜��Q�@ T�F�7���
��˩E��U_�d��������κ������A��]��S����7���j��&Nj�Є9'}�rs:y�D)'��TfQebK��S��a凮�~����"}g	�ox������Y���ݙ�:���D=�5�c�9�  "�/�?bN����F�@���Ru2>B��3 J! ��^�+����9
Z�q((��4;���/a�f���Ћk�7�R6����k �/�����#�܄�3��>�˜̆�@���иAz7�~M��P�
�q���Z���רd�u��s�`����A��+dUD��7`%]�gsEO@����\���h%1��U�i.�����鈨�9��ia�懹�E��B��t=`;�+�x�1��g"��c�*Z>v\���P��H�mƷbD����%�k�퍚1��-��\D�� |.�WW:8f�Y�g�}�ݡ3V���,>F�y�h�At�s]�Z����E�q�B�A|�d#�k�j�k"�H}b�A\#�4;:�f�p�dϥ�I���ߠ`�t=RT@�7]���3���,�fc
<�2΍N�	J뮲�)"|�֫��H[�̥���>2f��,��o�j��*�";��.���f;�/�5:���A���`�]@����Ti^F5"Z�b�`8��֞��O��$yB�Ax<ԛ�Oq6-�5<�C��I3�� ��k�����M��ȗ\��P�Q=3�� >��Ov�����Vl�@�u�	�IՁ^���*�w�=t�2a/��r8sbǜ���E�B^K�G	�yq��"sF�ʼ�"S·5J�;4k&�l�SbtJ��Ƶ8��G�4\+'�d�L,�{��E��Q*��@�fa�$3��;�f��B��њA!n�n7��U�du���"UxQ��d�by������8�!"ҭ;�u���0X<�]�l�|�x��;g�S�[��\�*G~�eFY)�@��R���)+��e=
4S��d�\����L��0�����kM�2�I� ,����K���I�1i�ySwU�* ?����8QI� �[�/��G(Ҋ���CQ���d;/\^��:�$�p�����{%��m��~�Ne��7�+v+/>�I��rKa������@Q�P�2�El��'��(hV5Kuz�� >^C6(mo�L���Mjlo߸N�t���v-�3m�`�CWy�g��6P�qN�JT��S�kw��F�4��oc��#I^[wfڜpxCҒ�|���be��.CE�RɯXv)��L<Bu��uF�D%��,H��qn�?a�'M��Crg�"��m��A�YV��	̔V]ڭ�@cR��Nu:�B�@%n��
���ӱd_��o�����%��f��1J��D��� �QIx����n��ͭ�殑�c�� �r��?YD}��|bs�l�r�m��{���:kR��YA�u�ʨZ@�Pu�z�3�xҪ�f��tE���#�%�͜�s���v�F�@�QĄ��QY�i&"�yDʁR|� �|�P�(j�H-�Z�L��[2������W���&�����|�굽Cer$=��$��	��э�����Fa��y�,@��bU-\R�P��b�����%��g�I7��Y�D
�U@ãL�^h!�LAD/�^YW_�څ�z.b<v���qD��-��R�1YBz�f�V�_�T˨)�� T���i�J�٥��3����-�����-��$���`qE�F�� �5�K����Rt�a섗鹡,��V�I ����I���iF*j\KS�]��F�h�W�c]���Z��:c��b�KQ�U����+O���<����� ���+yH7�k�Y�MS�����w46Sļ�?��ऋ���z�Rg}E�m\���8	o#�}��Ҥ��'��[spEf�{��fUqn7NG��	XE��ýy�t�m9;^sKJ<@y����*�1���Տ[O 0�9v�^b��I���SYl�.v�MO��}0����B�t������<_�����W׎�t� ˫*����|��_�		c%D�i���b>�ڨ;i ��%�MQ�1����~!��f}��H
��UB�c�6?B3�T'�v�Y.nV��ȯ�:ej��J��լ���YhlLrB��p �VY�������g��)�*�F�a���Es��tqէA%�B��)�����+TWa����AGs��c�/P���8�j�$�tm��ΰ66@N��'�j˽C$1#'d�jN}�n�n3��Y'd�B|:�4M/P�~"Z�2&n��XY�*�S������ �YO��1�@�좕s���AAZ�Gl��!�pᘤ;��*�Wȧ���%�#�_�v�Ǹ��ڏ�0~PȠ3r�QO1�����lȤ?(R����OPZ��cҒ��8�i(�Ƣ�do/'�5;��w�2���/��^�s�W�m�lIA�w�3��34�
�I��K�3��6�<j���̞�S�%;���xٺ���d�$����� �䆢�u�̙�wh�XS�����T��nGY�B��WEc,���UR%uM�`�ˣF�&�X���S�J���%�M�b�	�r+��b�Kt�G��B~�m�A�y}p[�I�Ϥvb)P.�}͙ԾCm��Q�P���6up�\v�L"
+�!wx�]Do�Ջ CEM��A���	~�(�Q�
���a?�ѝO�d�a�Q��dۂ����3�'��Qx���2�����d���/�9ݛ�!�:��$�UA�56n[��V'��5��
�ٿ�����n Du�A�ø������".�2�ԄVs�j**��>r	,�4�FjwVﳈ���bm��S�f��r��s���
k��<j���A0)�d�&�T�[u4���@|��n?2_�3�0&��'h�֖��
I��39�N����d�$���r���Z ���#�IY*�P��q��l��3�tLd����ң�-6)ё�j����+�7���T�a�ns�:�60'e����9%��U��>tmv����:�!k�Fp��xD&�dg�QF<���R]8�\�ڤJ��Lޯ(�\�G����}���.}��;�� ��.�X^ ��ƬhFZº��L���Y#�pR�Ԝ��J�A�X�s��s/l�Q0Ɗpx{i�As��@��Ǒ2��l3�h/�[w_ۘa��̴'�($������N2͂>�g�=	�ɣO�+d�(8B�y/�~1jewr�UHr�Ye�C=�	�|y�l
�piT�=][�K�8��W����q���G(� ּ�d(U�;�H<wiȔfӝd,�W��Cev    A��S�y�vgvi9�Qc�{�w����{�������]�,���}�;(�.=>夐m���)��B���@�f�%y���&,�`F�:8d�8ӧ�T<`���4�%3�
�9�P?����NZ���b��������Ϫ��%���E�:������^Tqf{��m�s��;�z���l��Ӕ�5"s4~΀��$���)X��d}��M�5����(bݦN��)��Ȥ��V2�??@q6�+.�Z: L�H��m�@��d�*�,03w��i���]�&=_L�S;��9�ƾK^�ղ��_��˦!�ZX��қ��8+�R	���x���\�C�����nsD{�
��8�[�*�T���~��
gӻW;y���0�$���>K��n��π��<�u6�8ź�r���f�L��Zs�A��~,�fj	K��g���et�����R �nrg��������!,DuX2f�1=� 7�",�?:K}���M�
��G�Y@� �7�$,��5R�&�	Y��[s�/_=q*�b�1n'��3��p5̹<�k��5����q5��9�v��q�B���������*�3��2=�A0;�%���:f�D���X?�&�@q��du4�f|��B���8�Hr�+� �{g׮��Os�:�B��q�~#[~�Ҕ� -��z=�'���F��>
�DrL��cֳ;O�dQ�x�a���M��4��7��)����KS��#��OÜ^͒`ؒ�7�gh����Ԕ�l)�Ȁ�p�G:,њ�7�o�Q{�o����ϭUe�j��@�N�	�-$}d�SEBfqP�]�}�u�PK]��u��d^hb\BC�:H໛_f=��D��nS?�ڣ�1xX��9��˜8#�e�hG[YC��3~����x�ύ�;W�\&���#�dL���4FH���5��G_g�)�2�m�4�x�����!-���z����9B�(��X�e��Y���>)�ui��^��m���z�)H����d�J�F�=��춆x��B+������[��3�f��=Q��0�%�g�@p�6j���lxF���~�����h���ܜr���9���+�!\kpF@�bq��=Q{�$0��=A����dP�H�5���O\��qM��:�,9�C#��@|�
�<�\נk�:�|���g�*��vsQ���,�v�֔�1��꛸y6>�a�Ř x߅5�"GSN;pξk#����E�&Am����C.xd�bF�2J�ɥ!�;$3}*h��џ(sک��E�eP��HY�A�`�S���_';i����ͩ�|���<Ԇ��౱�K
R�[0��}��j�����󸒧2��i`����!^�-Sq���
f �#g$P6}�Ƕ��&�z��*a��m�t�=�јF1V�D��G}[sm���!60�v*U$�!@����_N�k]� WA!7�����.g
6KB%�S�����=��X�"�,��M�f��~�����A85w�(�d�����(#�x���JO�d3������1�l��f�Yvc�뚆���>�GȂ=�ӛB�#�^j���eլ�Mf�ĹV-�¶b^��R{I��I�B��J*�B�$��kE�J����A��E���q@���S�3+�<ħ�|:��XM�;�mH5��D���$�̾��%F�R@�\��՚�O�Ӧ�e�ڇ���f�>Bs*8�P�9��\3{��<:��BMIǇl.����9u��XƮz'�����O�U�Y�!8jTEWm���uݪ���.����u�z�qe�5x�r8VWS�yE�Y/^c���9�J'�)XZ�6�a��#J��,����|h�|�{:��,v��r��Fb���p�:�<9	�UpKy�,.�,��]����1�E�ݨ�ZK��{�ʤ�a&섽��Ӌ��t²��-���.�Yo��{>���"�#%��K�d�#4��D��%��뤺��T#Y1�.��^�4��Zj�q�W8cz�p�w���/�/P���L�B��z�tmK�a�fly�#�I�1<A+�'ƚɱ��Q}`���9LU��R�$h���ZkQe�z0`mv��n���l�ȅ�R�<�J�7����Gd�kk$�%6�� ��Z�N[��T�+)FHI��Z'��v�]1O�X�jº�,�q�p�q�]>k�ԝE]99��5��*�T4r���	b
��dw>�Zk��Z+z�v�![[�J��ԟƒ�O�fv��R0f)��1>Aiq�9�$'j���G:�W���B�kp�	���!kG!\n4����`�ֱ���Ȉ��v�[r�2�_�䇍{M@Q��W�����z�!]�҅;
�هЬh?��Y��q	2���*3�hF	Ό���Ek��5F][xnv�"+b�����2ӕ�ϗX��S�fU�!ٓ3��5P�=��1Ē��Ԏb2�>A��4Ӧb�^��@����f	e��(���KL7��W���Q5��b�pc��>�V��EN򁆌j��/"��^vŜ̢�l�M�����z�ڌz�3����^��,;v͌�#�����‏�U!Q�bX����6�b�g��݇��V�✨��a�6�C������,�=zV��
	O�k�1��7��'��V���Du=��wi/P��z��|2t[#���)<�Ψ	�n!��"��	J3P�E�=\Y����2`�,�x07�l��WϤ��㛶���q�b���k�>��dW2������GH��	u8|��'>/J�?�:��N�i����G	Ȭ�|�l�K%C-�_�6��#��:>8�\r��Y����� ~�O�ſ�S<*��Y�lP���c�;��V��l+g4�lc3J���{�����jc�(�mUG�\�uv��:	�,�l�,���#TW'����T
�5'� � �A����J�aW�`Y�aP6�<r�~@Uy�I+�ԙ׵I��R🖁p���J��ǌ�����J��<�����C����bS��]?�
y���;.iL�$���4�g��[�Ъ�5B4�uN���t�<� SZ<��0n��7o�C��^�l4b���[ҕ�-z��I����4=�֍w��Z��l�Q��W��4�m!e-rzj��3����"G#gp	*�gh%Tp��uRz�v=G,�_v��<3ݤ�]��@V���H'3�QR�M�ª���Jf��B���r�A�ZzHU�d�xc$���<�""J������Λ`c��ց��-�I��V�@\��|��|��������d��nb�CL&�~�ר���`QuQ/�z�ꚙ9���W7]��={�<Ψ� ��\��K�I��"@����G���pD����,�y�@�P�]Z��	pn���,�'w���L�wL?����|�l4�y(葜��6r�K�*WVC�bt�}��j+ d�u5@E�DP�G��g�'n9��X�.̳���OD��5���3�OO�v�9����>\pΊ� �b���.���F 5S����+�u�1fl^�U$䶫h�R��K��d���A��4�r�t	�:�b�>��,���!c�Qo0&zC%������f	��w]u��B��� �x��i��8�` �6u���Bx,2��,�~����ު�;��u�F��}[�������d��@�d���\�����B�]T8�w��Љ��A�iū�l�o����c1@��·�^��x%���2��`���1��������̹7h2bW�s�[�x�M-��N�ص��� �k���� �I�gm��:�X�v��y�lW��b-ٵI���P%9ac"}!v���":�drL":&%l7M��g�j��WT;=�(`�DL�Lp	l�3J��9./��C����	���Ҫ#>ݝ`�f�cc�}?�E^ s��M`���S�ٷKW��$���=yi�_�I7Yٱ�/$]�f?{�ih�쨡�"���D�g����z�}p�l�e9���c�1wPD�!1J�2{9�'�������li��eS��3�����m�0�������.ȩ��� e  Ab�e6+B�f�l9�Ud��8��d�����ٺ���W��5'�+j�~*��F��Ϩ�W�b�4���A�}e�jL�:� 3��QM~���
�����	�^�M�Ms  ��{�U��z��&y^�rO�Ӵ��)�졡.X�u��١Wf����j+Fr��r\��
�.�;c�<wh�όe8�P#6�"$Vg]�H���KgCR^!�����w�Vh�/W�=C�	���e��MңAU�ƜD����zXt1���Cҏ�џ!#��u&�����d�b>����@ado�k\��m�����t�,���=V%�ie�� ���S�f��B��� �e�twwh���.�V�5e�]to񎛦�f-�V��˾{6Q�2O�S	��"�:��l1s����M�̄�@|�;":���p�����\���ŷ���ѻ4`������.�f�A�ܝC�^�OEGC�a_�}Ǳ��� &�Z2��F�:�/߽���j�ۢہ�=��Ff���J\(d4�!ԩ�ZC�s��lJஅ>�_��@A�LQ
�[����u_����
EޅYU�n�JX�WWdKG��V�nTd������r��P�ۋaT��-�,8y�Ɯ�Mz���c��K�%n$A����ԛ��J����/�EVB�v#��=��"���� ����?;P,�̱�&�ԧҵ�A�$�l�����]:�J�g��� fd�'г�kW柷�'˯5/�2ʣ/�b��Pfծx��C7h�coJ� ��9��펷D�`��h�D���btKHz�|���ghf/h��:U���)�Å�͇&]�$��8������
ƣj�ey`����TՓ!iq�#{�'���V,x����z	������ƍ��4�K�w0N���F�؎���Kn��VN?D=m��3���tJ��ø��
Va^f�6A�ּU������Ty������ȲgPbO"�uæ����G��7��b ����rry;��(�9�S{&�#��-�.�GdKQD�2�-���D��������HD�M�ț�ָ�!����w��~�	�����ƒ�$T�Ǖ��Th�t�x�V'{�w���Bl?��f��%�Q���Y���w U��!�#�99h�s�P[A���r����XDؠ�tc~�����U&�@\BPT��4���*	�T��@\D4KF��l��lR�AKn�� ���`dFPz�=���=B6T��������d|M���I_^�Kc����|�m3r��N�<�@r��������P�kۈ���X%0���2{����Ci�w�G{c�u��=�K&�Ơc.a�nKH7��n�^\��L漇��yr��}��^�l=�-���D���9s�RA�0�^��i6]���T��Ӯ���9V�������$�E�;�������I��"��e0�ԾCmuh>A�jVH ���<n�v�,�ZU1��/dm7��9�j�,�E.�F��^�q��x���-$��a�:T<MæR�9%d{&uK)5� p�A|�Jb��d��YW'(Wt�����"|i��Uh��F��&�ȵ��d�kϐ��&�P�Rz##����<�ٕ8h�b����rYKG�v}l� ������:��g'��¶�@B�W�-lZ@94���uѥ��Y�FML�����8���:�0�-7?z6� >��ҳV���� 5��%�?�34����,�u�}�,攨Y����:���H�lG�8���-�6s����(����i�s��YJpZ�����	�$��hȦ׮�"���d�v����JkwH�Jf���TU3���F��3�5��������^�?�w�޿��o|%M`z�S~��+kg�mz�5t7ʃ����5�)�Vi�gK�32|����?�c��W�BW��{��'Ф�n����dPu�h8h�CWc��gl�S��&���QWP���2IC�5���V�d©9.a�rY������Q�Ԯ7��.���-�r2����5�P{�"��x��!�o��~mO�yY�$?@?��74n�v$�,�_ �R��������5��_�B�g�i�%�����5�j�0���X�YKD����tM`�����*��5�M��#�8�������*��f�@�FF�>���t��W�ev/�W�8+��ԠC���6k�˨��2<�
˯Pu���4}K�tY�$>%4���.z��.�0��o��J���]땔A����4F��,������LU���H*�&�A��/�n�"Auמ.9�f]������|IP���Ss�U)�z4�*���0J�/0];���1��^H���L0�O�]n/�>OPG�a3��5N��g�:vH�Y�e=&+�0"vJq�Р�HQ�?on�#��k�K4�NPO����� ^f5�'[oy]����g�Ro�x	����4�{+�L�n��Z�3,�$�Tj�GN�l�� ���I	���@d�^��������r܈�6�W�/B���ns9���ĔNrP������]��D�o�?ݞz�8P?Aȧo�F�-�/F7��M9�9��>@�Z$���a���	-���f�%�p+�z~�0"��'���mt_�p٣'�哦[�U�꨽ť�
Q�m�n��$�zĵ��<��(ä��׹�"ϐ#����Ⱥ��}$�vi�ᢕ�L6��_��>��a��U����q��!�O�.�fWPG��ugФ ��B�
J�0���0~R���:�PKԞ��!G� :%��;fV��4�gtk�l0��r�.u�m�2�U=B�=��Gk���!�d���m�--N���'c����`�xP5�͉�8�W��5��uqN$�^!�4���@9�@�Pw���Xm qL#�&Q�X^��Hc��K-�mCU6��]�^,QT��Xe�A\���ЪLf-4�q7GE}�Ex�%Hp
M�8�8:�
at{C�}D͕�< �v	&3nB�tM$S�eJ���Uq�SL���Ձ�r���<��p�\+��P�����~�`��WWy����lu��N3z�4��蕩5|����8���q�����_���TO�q/�`U�r��wq��GȄ3�N��e�aU�m�X����]���� ������^��3FS����]��^�õ ��FٌQ�X��<Y�
��q�xT�]є�vG���#����kV��#gЅ�?�uo9�^{�\�����������N�4-�� �G��K���C�jҭ'�y��2�)��v�gzT\R��Jes#`%��Y��-�9��*;E��=#f��� ll���G��	3�-d��l&Nh�V����k�h�u�5="��k'�^�����}��
�n1���u	<�>�������z�F�W��= ���K���gv�7_z��B[�Z�b��Y,Rh-���?AL��K�&��s�&��B�@��p�w����}�#Ec��#���ب��'����D�(#>S���h�����/T����~�°Xع$0��e_HO]�r��^>9k {E?M���q�Gp��5�""����A��@�'?�?жP�liKPmXK��`��\�`a��'��s�P�B9سBT�<�G��U����9�?�G�(mɔ��&�/��D{�0}f���'w��pP�ϐo=�ˢP׸�Cc��~ܮ-`є�C7'�Iϐ6����́:'h�P_����}7�jvpCp+ϐסHj׷�`y�����V��R5_��	,M�7��]��#d��*9�ef#Q���,v�%9���BRw�;����߄��2��s�U�!�c�^�����#��]�U3���hg��xm�*��,��Vp�?��%t��޶����bDF��x����7��������`�      q   h  x�]��n�6��ç�����'�E��&i/
tCK�ED&Rr����vGQ9<s�qz��������^YD�UcL�b���"[�/�&�I�X�Ҧ�>�WU��f��EY��X�rz��:���J�֜���������x/Z���u����7�J��baL�V8�*�xB��e�1��#v��3��˶U��E9��ӎ=X)+�xI��m����������3�8=��J�g������khQL�B�(w�
n�F)�;�{���G#Gsz�EAW���6g���;��Q����8��ѽ<w�
{��Y�ps�hH�f%��t�"��Y�T��MJ�Y� �g�,�S����)�#�3�Yu��9=g�����(�kT�m�)�,	�>�#&��˸Nj'Y-��$�'s����_Y�ғ��~K�d�jd����v�҂%��7��8�9qu,i�e����X��^��v��b)�(�FO��	���,M�g�X�$�j�тiF?�`�$N�/�9�������-�iI/r��M`YH���$�tg�	b�,��P��8jL%�~�W�z���]ZLg�je��|�������V���a�Lib������p���ֻ����ctyD���������\���<8���8p�sz�ҩ8�#W�Kh����Ԭ)B���1���+Xџ⌷ұ"FZ��{�H��]����0n�9��@�)����⾺WD�Y�V��]sf#�8��/�%AeD�vܾ�')�1b�6�`��P�޾_�Uf�"�0��	�B���{Ѱ�KEaC����x���AJ�����4_��_�����&��hpy��mmQ<xBA���<��`Q~��ػ��ޭ��+b��e��1�-l���}0�1�7<��G���r �M~J;��y(��S��l��6g90��zX�O�da�JШm�	c u=4�[�{'s�t3��d3�R����`�
Ⱥ������(�Nb~I!c'�0�i�?	q5�޽dҿ��l� �Ք$��f<rzE^�3c`�룱X�������?l�D��wj$�@]������?���n���AV��`�G�2�UU�4ˍ��]3 ��%A�u�[�p_���}7���>3l8�� W���E}�߷���� ��Z��+@�5���x��к<�8�N$k??6����vA�gU׭^���� ���x��ʴ8���ޡ����\�qcX������u������;e��F�$�iޡY�8�VK@��������N��P������Jr͉'w����Ǿ���k��7}#G���������@�{c@�n;�`j�����: �� �A;�x܋���+F�CM��߿1����>      �      x�e]ّ�0����b�O��X�;2�lDu�$ �D�����?��������S�_�?����W�?�C~Ҿ������l����k��v< ��j���m��>S���Կ�����W������>&�Q�['�_�>�<��G�w|��{@�ߺ������I,��_������q�1 Y��m�������_�?�ߥ#����0�?���~]���y�ϧ�O�S��p
�?:9�G���ׯ��3?�Mh�g/iXB]L�����lu<���sn�����S_?]���	��}�]�?�*�ʕ��uj�J��CO|_ּ�����F�$t֢�:?u���Z0b����Ӟ��6r]D�v����~L>R��]������V�����������!�OT|���e��Q�|u���zȒ�R�['�$��)CW���vv���t,DS��w!���Z�C�U�]���D�<�g̻��]|��[����v�*d~����1�NK��ա���?��֝�8tv����]�>�*y����vv�IE�k��q��"�o���Z{}By����ԅ���P�t}u���g�P�St� Tw����~uu}�߻Ġ7��K�C+v\�j�/N�J���j�Ɋ���M~cPA�W�y>m֘Ϟ�M{B}L�{���J��i�c�'Z�r�_��&dj�[�7�i���̙�O@CV�`����@�{��k�S6�w��.�*��Ճ�@���-N\�wމ㉉Ũ���g��މo(uAݡ�u�����m}��=G$jUU �O��Ѡik��У#��E!�V�����b��x��Y�;�O�K_⻪7 RM��^�p��;y(X��X�0��.�CU�$��FH:tƃ�����U����Ja�xvu�
-V��~�gݧ��6�H6�F���_�w�r����=�.�6���:�O�!�#�a#l��P��}�*)��D�I[t)+�RϛF}�����
��/�.:��w�@��U���η��+f~�qf���G�pɕJ�vlx��������8��&t�谄݌������!�W
�H�J��[�W�"rG�9�3GqA���0�����8�B���8k:Sfz�U�����Xz�A=�Ɏ@�5ǁ��j�_�1@�=l�>������je��m�ڇ��O���6���|���^n�kk�L��~b��S�$�\����t�K���U@��Am8�j�׺��5a��}��[�W�n�UǬ���6f�7���q���y��9��GB�n���b����W_�4����Up0+?\dT��k�>[l�gn�� -�ժ�-��G��GPbT<��b��q�G�rt~��%�cc�:��TO���i,LC�6���W����+�\��w���:'��i��
2�ň�%T���R���U�\n�1�u� �&d�K�| ��d�lh�	�_�wn��#y.�uH��;ܹ�9��:zQ��Io�W?���X7[���Rh���
�F�F&7���B@�]#Z{8�^�ֽ$���G-���íy�����L�z�P+6���Y���UB"��}ҝ���P�%��7K�)�	|R���v����}����N��7�j���%}�"	�ks�Ȥ����'%�>���a�ע�ݒ�)�!Xߐ0w��|���D��[MUOS�w7�A����R�m%�����v�Ѐj�RUBU������jQZ�u��x�ot��Vf����������轆������1Aх�=�r�w�h����1b��ոZ��굯��f�m��!vҟ��+��Hr
���=�Ā��+˙N�H`YVh��$�i����P0X��-<��|�k�]��~_���ʳ|U��ٖ���.��r��Eh��X�Z�
����,����y �5c�մ��wi��T�����>���!��ݕn]~���-�ǉ`�+���T�n��T�W��Me��@���)����5-ܿM�ku��7��_��u@�VK�U�^�n�zL�R��9S�.��Rw�ӗV�O��3Z�NKa8�k�����&1a�V'μ������ͫ6����Q$'$f��R�Be������b�q�c\�ż��9�#l��!O9x�� T�p�[�#��!�ABO��l��HG��R<AHK��l���4�#� ��ku�N�`��p�+���E��1����x�ɪ]��t��LwoޯT�Q#&�Mе��s7v0z���#P��a���Zޘ�!�=���(���=j_���(	]�;�{ �i3a��0t�Y=�t�E�$l�YkKGQl���^�F��T��0�^ġa<�;�[HW�̬݀
#4���m�D��0:����k���#:>��B�Y\�{ 
�7���H[9�f��a` ��>	c�P3�f�lZ��|H*78܎������+&��l�Ї�8�~�$瑨�]S`JyM	�����p�bg��mP��V�]���T	��p M��Q����(ԗ���?�tk�oi�i�b.�8�j���f�N CL��+���W�ku�#�Q7*��A�*�p���7�;t�"[p*捯-��c3�$�u K�fOnJ`3�¸DvD�+�5�pD%)·3��(�s�.�2%x"7�[��G�Xϖ�qݎ�9�0ikg�^�+S.�/�P������B�pu���-�w�'SM�9�'~ǐ��;�)V�tf�]2�\L���j�<Z���b��unc#��H-�N�!�Q��!�0�~���� ����4�R�\�J��#�fU�=	+ב#b+���n=�U&g\?��\o�v��T�K߄����F�y�_T�����	�ql���I�fv�skx�:�20�����-�N
&��s;�;�]�< ��i/�H����67��L%������QQT�fPX�C�X	��P��t�xR=����22Dk�^�`�=�# �ڌqu��B�x�#� �yq��f��#�]���끭�X�b�[���Y�d�{,*j��=9W
+f�)Mˆ��@/`A�{��rL���ŰLL����-�s �	J�A�a{�b��A�_�U�D��Z�r�j�%6|bA"��,�hf�C ���!&�m��S%0�d����0K��0"���@��]��U��H*F���$�4�:�>_q:T���(>��o�V"J5��ʯ��*TN:Cl�*�q�L�����D�HB�c1�A���PC����|�@�O�5�}�F���M�{��cD��$�K_��11�ձ4Ir
W�>Z(�� 3������~��8�*������ā-eĘ�M¯������	��>Z��@���;��B�A�҆b_�n���:è�E@$V��H��k �#���]L��M���5_�Hx�,��Ҡ�� �L���zG��YTw#�O�E��kذjyE���C�*�&r�H�8Pʄ,dD��f�'��ܦ�81�b�σtΧ�>��z�'rP�D�0��|�?�h���T�����;�Č�!��t?F>���G�1W=Iv �����R"^q����߂6�'���ڰ?I�s�2�$�XQt[!8�s#~�)�q�U�6���I�;�<���ߐ��1[>kq�ҋ��}�3�H%���2�@�71����-_XF��H���̩&y���I�c�`�U�@U��AϘ�%遏�:�����m��Z�6̜�*�͐WU�L��V��9Z�/��}eʩ����u�6j ɤsH��.� 	�%������m?j�_�`�p`��/�\�s5gt4֘6@pY8��f��z�D��<���T�\{�YO6&kgQ=pA<�`�Dqӡ����qt2$YX��7ˁ� XĪ��IqC�Mj��]�e�@}bBGn5\�"����.��)9	�����a!��l�_��"�6��L����'y�Lͪ������J�	�`����� ��q�Q)TvLu`b��L���	R�[�G���#�Kv�2ƷЩ�q�T*��px��d�ݦ��5f̥�����L�5V�"`��LaW���iy3�Ip��9�r2���s��ٶC�    >��:6^]2�6r��^�J��"����j�_���р��q�$$�ت�EF蠸��0���]g�u��@$���CN�)r�H� P+S�}����0��� �XM!�=T��p}�Fj�}�Wp�am���pR0��OL�}n����S��� D1&:A�6��`yq�A�F�I���#�(�V�*O�욅:	�7���IO�b��L���C��T�>"�,���ŹH�?�)@�
����ƴ]ι��i��@d���Ri�n>�x�p��-�B�Y7�ю���O&�ݡ�zBr�R��t���+�$km6���>2?;2���5��V��EWO����,��AQ(D�̼#h�aMz�%һ�M�u�U�~�+_G�����aG�UHf\�ҝ5���x�1I�M�ڝN��l�X>q�T]� ��C��ʉ���;+UpI�N�@>I�5Bo rlL"&�hdK���l��� 4�oH>��_���Ybs���3�K�CS��J~�%z=��û����V����R#5]I���0��|c.�Un��$��,�m$�@,�Ɩ��TO"7��aVQ@�A�R�~ЈFw�t�tR,��$�n�0�Jv�,��$�A���O��ZvGM���R!ʹ�n�Nw��S�8�ȏ}~�c�Lk��I	���=�I	��H�B�`9h道a �b&�Y?�e�ln6���3"愘���7�8�`ұO��"�.%Ke�؊5� �<���0"y��,8'<}�`�O��8���*k�J�*m&���2�t��Ip}��Wɖ�7�ꆪ��@�o�0_�f��Ҩ���$�����|���2)ܷ��j�b`��Z/-}|>��v��Yb�j�E��UO(�{M�r�v zj�H[���I�M�6Bf!��H�c>�Kh�}zB��P2��$syE'�*��d!O���1̔J��u}V���$�Z�_2S�Tp%���mDsW̓G�.��c�V�sV��t���9O�V�b�$<ZFQ�Ĉ8�\g��\=�*5��Yc�-��Ҹ�$�^��xV�nf�/,��%	oa��z�nCyV�7s��t��-9s���w���jV�	�)�%"f�Ny"*��~�Y� ��(�F]�x���/ ��}�b��K��> ��X�*�g+dX�Y�ċ�q_�*��Aif'�4�TY,%3Y���q��%���.��\�t�r�_b	o�ċ�K폄�1V"X�&�����XӚ�fU����G�`�3v�0������z��*p��IٱïO��!����#��u�"k`�Q.�Y�X�"�B���O��4��XEe;dZ�%
Zz)m0��,7R�ٽ�qDr�l{����/�Z��ۂb�����u�8S��RRV�ڇ��G�=raҽ����l�F\C���%#X��W���C��J���;��8����[_�� 엀����8Y�T�S����Pʋ*)�[`�G��kj�5��5p��Pp7Ue��`�ٮ_��	珹*�'b��y��������4�MV[N��)׬�g�+��/`�d�(F�y~5"[�J<
�|�kY�6� �� UM�`#����3�V�_n�$kFE@���J��;*3��:ܡ��R�*3��(� $YXSq�/���s{ғ[8�gՂ~�qt�
 ��r��X"9�B+N�W勢F���.�α,!�Q���!U���z$�j�x���588�(ZX���X_M ��a;��ppډ�.뉈��L��B�$)Zjt8?/ϐ%S�w���̢  .)�l,�ߑ1"H�*��&/�!@��\���Xu�'�!���
X�"oF#�k��]���Cad���Z�ѩ���A�f���ѡ�\PI '���	�Dm�B�E���hV���UcB��A�u�����8a�S�4H�J�����'���r.��X+%���*�p8��ph�䙛�5g�w�M����s�"ܑ�`hk�U����Iu�)H`�&~���z��O<b!C��<����x6�	D��˙�}j\u��.]���$	�^M�ٶn4�/�qS�����{j�4əCVCG	���/���3pj7�V�/ ��L9�l�XY��	QBr��#V����q�"F��R%��n����;������E4	u�z�fG�ثڢ4�h�z��z�����<�����F�c*���v�Ǌ0k�V��z�3�eKÆ.Ʃd��ءm~}ZK�d ��̑AĈ%��Օ��eY^`����������T:��1ӂ�?t�)4����n�X=�fe{�$�0�:qC�D	lzM����:CǛ�%�T�$��h`V�@Q�8�O:<�H�!��LU GH)�8�CO�^�j^(}="`(���d
^�Q��
��?8G���&a6/$w8�]��$��f���0�G�:���ϔ�c}&�s|�!3�%��՘�Э������<�� �+� 	�5J���*�*���"�=,�]�����Ն/�Ҙ%�5�2�{4�J���@T=ֺZ��BPgrZ�O��[�b6�$�@�P�v�DB4H��k+BN*l2L�#�'�'�I�u�T�C;CC��Ƒ�1���z�D14���6��BXՅ�['�:d�َ3�H�Z���_�+r��f�j�x.�YRM`�{�l�sj
�'�pU!-Z^i/G�K��[Ʀ���ڡ'ul���M��ou}�~D*K��N��@w���I7�YW������ 9�VU �0�Ld������Y�յ-ֿ'�J9T��i����p[�)�n��Q�b��T?�zK�$G�2� �}	SS�C��,�1��>�:�Rq&I{g&w���F%Et���8F{��دN0��8�誁2�9����\�N����+���	m%�Ϛ��Ȼ�A��M#�!�bq����Aƍ�J�X�V��oG܇7:aׅy*qM1�!u����aQ���QEx���VG�Xm�ҢB��:⡋pԟ�H�F���4$�U���
��=�~AFjV�,eg��d_}�L����YG3).�@�j��rϠ���pv�����1ϧ���R�zN6AÔR,'�$[Ru�?����t�c�R~{���bF_�N><����67�.虽��{.�[�V����B�x,<�� ���F��c��^ �x���q=��~�A/�;��*���_�dc�՞QS%R�3��{H��<]�e0ph_`p(��xI���Pu��ً<�q�ˋ6i��G&�#i	�W�V�ܦ-��"O%��ZACT	���EtT���c�G��FR�%�qX����r8��W��Y_0Td��.c?��L'k'c�1H�:�>�a��N�7R��j]͍��}�BAkpѣ��
����4V�'�(����#���[��6o�Џ�} ���b.l��T�n��[���e�^�%�o�X����ZR�ܺ�lo ���og%�G�Hy�ҋ�beB`h�!�6# �m�w�&�.�Z�<F$n��]t��O�D;�k}zI�*+�M �#9`��DU�/"�ORc���)�S�&%�͔���5�Dk���_Z�(��t�Q�^�O�Sg8�ki�0~Y��>T?O�/=
��ܒ��Loj��/V�K�{�}������^"�+	Ie�+$Lw���Ã��/�K�T�1���j��@�NF`�a�R��lV�w@R3HCF�%k�k_@��Fv�l�L�(`��B���5��^��:�
���� \G ��j�rn5#\_�4��f������'��B��)f{uzck��$�/܋t�N$�;5�b�D��L�j���������@I��P��
l��u[�8*�S/�I߄0W�fS3s0q6��Z�a�c}!ȶ���PI�W�b=�;EN4��T��	9�`��R���T�a�zJș+�����$�����L�5�� ��	�`XH�⸃�Z�W��/ũ��	t�Yb����SKh4�a�s�v%체SϜ�XƐ�{cm(	�l�^��Cq��������$�L�E�U��X���s�)P�����ݫ��_b�1(�`JZ8�rt}�Y�DL�Y2)��v����&܇}ETN*wH$jŹ��?}QV:K���    �#�
�C[Y:��/ط����J���27��FG�X�txLE� �]&a~2�j�ѡp�4l�杬G��@����g��'>_�Ne����u�άC�_�֗9����A
� V��}_��� b�"t` ��!����(�ڭY'�T��-g$�O���*z��r���A���3k�1���g�R���;�g��
�δ��+�x�6V��_��h�=IBMXcK�:SR���f�<��bif�̇¹$��#h%�I��)�|�+{��R���SO��Upb�c�`A�A����? O:�.�4w�6��~���J�X�;���r��㨢4a�M˪��i�p���
#�Ι\V�u�kx�E���JE��O-=�/���,�9�x����Z�� ��ץ?�Iެ��W]��7a�T7Y⊯Xx�ś�� ����ayg�����ZO�0��������.Q��K�1,��8��m��o�R�+��.��r��j8�,+	�� k��cA��qAK�~jhkj�,w���$�s{���Vf�/5$�X���rj+;<rR[l���W}�S
�yJu�t=�ͽ���x<�E��u�A��D�3p?եob��>�D�G.�y�@��1��k�����F��@Ӱ��Vq}i��[2��U�d-M<t7�z��ֺ2הbiG� ��OTJ�S�2~)�^��4����NF��>��uF*��S���=��t+#Q�q��L'k
}A��	G$-�c��y:�k-�R��CY�]z`������u�����P��>��JB��A�Vax��>B��}�Z*1z�Xr���Jc�D����[�w�}�vITe� ��
N	~1��G|����5|ّ�_^>��Z��/�ʻ+�W�c�}z&�u�՛��4�a絗'7�ؒ���sm==C<�!�agnϕ��o/P����6�wTy{��R�O��R�L���۾�;�ե�X�����wS�o�\v������o���AƲ��@��U?x�a]X�}X-���-ӂ��c�]W���� ��輻j ۩n�\��8��&:Ofr�.�{oE�k�����I�1�<����P�t�f@�tf�V��V\��A��,�����d8|hn�R/3�EΠ����^f�}��T�#W8�uy��&L��hTU~�:�'��N!=�!x7�ؖ��G�B�Z�Gٯ��u|����F�o�b_�T�7����5*aey������X\ϯ<��=ɏ�Cޓ�ˢ+oRc��F��Q7�cC_��ē��S'%�����S�B��(,��-��#�R.�=��q3��Ҋ���ѣGE�>�h��ݥx�]
X�G,3���vC� ���g�-��l<�+��a�&�8)�, �x{1ݻ��f�Ԅ�S�Kj�v��U��Ҟ�93PZ�M�VldD�����z�`{��:��h�V}��/~�<Y���ɬ�=�U:�t��3em0Y9�I`�	�k�K�7���k�=1T9 �m�C���#�
QS���Z��-�1�|}�g$�Sb�<L��1�����<����l��G�����FZC��K��^
�c�3��g}�������-�p���Jّ�펏 xUO5}��q2�\�$�L�� �M��4��VXQ� ��Lq@V5��oÆ�%5%y<b�Xv ���^��������ɡ
�bW�v	�Û� ���uoV��k���~B�5Ia�2:l�okLkD�Ӫ���n:R�Oj# L��RݽM&������k��Uy����->�٘"�e(�;�d��W�k��'2�ЍMQO�z{�N��C=C�X��e:t[D}���wJ�
�|g���'���`�b9T�1Iy�ם���И���:���=&�s��97d����n9:{i���B����X��M%3�ٙ%�}1s����O�� ޚ�ts�u�(nZ/$�=�w�;��u��H�|�\ga#ʌ��p9�鵬C��8Kj�a�#],���΅��V���碇c��^��>�={.v�
|[}�c�#�+�*%�iqO�����v��4[�7t�,��ČR�C�bÄ\��hU�{���9��&�@o�)A6G�z�͚�6f���-��x3�XX����GjQk�U����֙o�n�Z�7�w�H�p��,�ik<T����߽�hY�w���i2:+Z�4��q���d��LO"��qQP���5]Ԋ��`kv؊N� ��� ��>��h�Z7��䮮�J�Y9���$����)ӵr*L ��r/]�C:z+Qw9���;������ɣa㻗SL���ƛ��hdQ�n��Ft�6���XS*П�����$/ξ�*�m�$Gay�fb�[B��-��N�\��%k��6��wb�LK'��R���汬qn�,M\w�4��`0�dȡ3��^Aw�Bl���HT3 f�^�o�����m^#�eʜ�d+���WOtF��z�༉�8�*.�hf��I��s��gVضf̫$��Pl�|�3������v��!�q{�xq[cu�7θk�#;+���L@=R#��5��V����a1��Ȋ�,��\��h����2�Q<�n�fEI�#�� ˖/��_[F���O�֫��Cᐿ�J������"-rwey�S����ਬ��x��1af�|���շ�����ϱ���3�@J.D�䤃���kSb��e�#�x�͟����#�u�2O�"dqF��Y��������y�k'�Iw�X�oy�>S�+̈́�^-�`b�G��k����X�Yb�t]�j��$������kr2�&����أ�ց�U���q��h�|Q<�rG�����ӵ	J�.��99l=�QQ�':{e�B)#9���*���>2��g�B0kj���� >1�����l���"g�1M5���3�m�ʘ��7�vu����7�2N`�Bd�
��hU0���qVDG�2Eò#qM�:5�U�g��X 0�t���6���l�lYJ�MW#�����i��i��l!�ݔ��p����[�v'[Z���X$��� Wl��`!��/W�8��'}7e|ړ0Y�}[@dN��2�\�w��z
��}UVHi]�g�͉o=ZX��J��I6V�'6�^;e�!Yyot����I�U���ȼ�i��%����������O7�/�n�<���*�|z�G��	W�ܣS�[C�E�Uj�M��`X"�Wd+���i9�{�	E���x	���v�־L"�Rq1�#3��&�y<�����L�y����&�^a�$����~
�s�;�k��r�u���R3�d��L�wڍzris�ٍu���x�E}�$�ۀ�y�!�}��Ꙃ��m�����R���Yo}�I������Y�:��5���Fg�ʝl�B������!0Q�4y�'�Ƞ�|��/�#��M�,f��'�DV'�r*�ӭ��cd'�B~���GtU�AL#MÀ����<�)��^�fz�^2zyZ';#�;��R���\�D����O�2��M��q:�k]l����Jj�'�w�'c��c`{�9�q�f_˙��B�11ț*��a}Y��F��?���}�L�ڍ�x�֙ڢ��[���64y�?9���+x�^�.�������F�$�	�������N��r���< ���s��'�K�V��"�����Q��<6Sm�^O�I�C#n]�#����t�O��s�S������t����h	u�=�K��-��ˁ|�j9k�d=YoOX�R��~�ly;�1~������"�J-|���=U�Kg�^܊H�Pq��ؖ��-4o��>A\Ǵ�h�z�&��U�T��w��]?y���8X���Z��I�͋�{�ƕ� { ̇�D��t�"�痠-/v�{.����O�M����ܳ��L�ڞu�ܯ��{S��V*9Ƶ=�p�޳��TGk&�����r�8zD��~F�F�R��L<�H̪	ڼ=�&L�;<���( �l1�0(~Q�zu���FC"���ri�����Q�1802�e�d�yz*6i�c��=����7�'��]XTONf��������1~���W7_�5N�$s+7[3����- z  +�Q�ЋM�Ľ}��"0M�a����u�f����R^
.)S`��7��{v�U� �v��s��>����\��I\C���^��[o����-5�zN���K=V+?hWq'�M+���G�>o���U$����Fy�cy��F]��B�SV��-�>+����~�D�ߧ%��9n��}�x�=�J�G����f�܆h��,v���m�[�+W����\̉JW���������j8(V�R� ����bd�l��3#���v.��6��Į_�il{cgie��,R"ܡ�<�"�2U�?�w¦��+�%岪sF�����e����S[�r{Sy�}��pc�`�����`"nS�� �`W�>/�?�;�U�T*w��f��[��*)�ѷb���%���jv�]Ր�L(j��t�,Tkّ��zVc�"ma���}���j��Ǯ�8�SV��T�㳄X�/���.�S��d#���Y� ����ּ���^Փ�OG�����.�x�(���D�6����0��G�z��یV�O�\b¢�׿�.:��=5B�kV��O�*�n���}��An}J�z�f�3H�U��`���������Jc�&��NO��L�=�RѼ��:�Ʃ!��t��ԯB�N�ꩡ���2X8��']zV�\����|�8����p�p�ˑ�p#�Ls���Mż�t�BfO���T�T��#�~骍j��0ݷ:˜���Ց��X���ppW�@�FG�+]��!�
υ��V��L��Q��A��ŋ�4�]��%�5_vGpr`�� ���lm�^�o�ɓ�7�]�ۓ����Q��Z`u��z�NV���)�>ݛ��2��$��Ume���FAi���x���~���;�|��o��s���f��=#�%������~��      u   /   x�3�H-*(-�K,�2��J�N,*IT��U��L*J,������ ���      }   �	  x�-�ɕ-)C�c�$�/�;Z��d1+�7~����kC�1~�k��q�o�65�c��j�_{���5Z�9����}����c��s��m��}�괮:L���gu럵h}���p4�?����V��j�ny�X�~5���g�kj���UBuڰ���ߝmX���MB%���=mغ��㖄h���X����T��:c,�����c�O)Yb����f-)����d��I��{~�Z���{:�RXr�2;��E���ħڹ��:g���+m�J)Ӧ�{���X��?}���'nݿ=�$�iڭ]���V���UY7v[�qY�EƔ}�&�䵰d��q�Fn�����iy_�<���Spc�VXz��,�큤�,ĭ�#�(	��wH����l��8}>|�ֶ-��w[��tı����iS������<j���X�xRG�H��9�:��Y#�p��W�g�#��v����H����E��Sc<{��]���m}�LI�]�Qɯd���=�~���Y���ulp�N��,p\��8�|n{��eͳ[������t�C$R(��[��3����|�c�� P���d�����v��l4W�x��$ ��K�W��Na*��$`�RAr�~�dl�'6b)w���@���>#�O�������D H����A�DUxB.Ɉ՛#-Y�7=��w؀ܕ3�jͩ��O�WrPa�K�i��]��q�t�h|���9�Y�qϱ��D;�h<L.L�2[M�|�0�x�G\�"��	J�ؙ�ҁr`I�$Ł���R\v�C2S�:�[腶��6������rt�X=Y� ��Q�L�-%s_ ��i����—�I�w�ɥ�w<�;ڼpY�����\ R��B`���s�>J�`�o�����Ǹ<�x����2=��]n�x\�_���䨀�c.=�Zr��J��~#�4�K�����i�7-hRr7��ڿ�	�^d���&/�4۬��C�|�;�_�t"Y*|���R�������%�;�{�a���P�T��"R_מ`��H�-�[%}D3 3E�����F|���&i?��5�5A��G��h[��
���>�����q,OҢ��P��(����0sB+5p�(@���mY��D�,*�����`��P Z j�P �1�
�«��^@�[�Dì�C:�gʥ�ڀ[�ч�9�jL�ұ(Z���z>�y�<�,�g��}65�p��Q8�AC�^�ʀd=*�1��}��Ьk��	,D�-IΜ����1���n�徫aJ���0gV�_q8|{��a4a]d���_R7�K�"/���66L�Bs�N�u����eԶ�Z�ʕf=d�f�jL+Zʀ�9M�c�¶��Ipϝ�̋�'L���Orꏉ�H`��Fh7j&�r�q�%u���=;�n�n�pȘT.iN]��M�S��c�*���dyj��w�̛&Y�4e��ŀ�Ŝ��1���~M
����g��r)�/�=�)�}^����}����t��"����L��O�,�9��;�mDۮ��h�f~��/�L��^�֥�����U����ݏaB,�Z��]X|q+T���&�q/4a��7i(�l� �2��^1{ow�����vS�f�P/J]�AqC��V ���x��Zr!�`�@�|�h_=AW�Fʫ�V��Z`f���#�;SJ�CW�l"0�E�A����!H��F��G�5\p���S�29A���\��vv�0��.�FFȕV¢��m��� �-s<5�^���Q's��g�|�]�i]+Wc`�@�1�TH�4�) l# �����\ ��r�N���QsG0C�x�J�g����c�^\�?�:��a�uBM4	C���C6Xn4>��eo|,�T�B�bb�X��0�
n�)D6�$G](Q����e�j�@.;��*�k ��`p+Y�]� �!RO[��)r-I�^�d>�	n�\Ǐ ��]��(;^�����+M�k��Ӑ �e�g��t�4�-{�^M����>�/�x�])[�RrW��R��F4gBF�`�)�D�J���&��934,�-���i�����~\
�z�aۓ��O�_�/5�	l�<����g�h{K5���<�L��xٲO�0˭^�*���9M`"��vTj�E���5y����BY��{����6~�������?s�tu+2!`��M����E�nM4�S%,m�Y��9ӐyK�!`;;��߬�WI��+��#���_fn�ŝ}��e֤/>�\a�~��$�I3 M�L�v�y��;�o�.�ťpr��V�w<һH+�˜ҋ��@�ܹ��3e�27�@�q����I��>_�'W��3�̍��� ��ml�a�%Ea�(/�p����C�'����>�P̯���n�'8�\���]ww��"D J�s��Cn��޾�ϼ�Yu)�u���X�|4>���:Y�	�r��"R\`!���/o����c/��P�IC�Ŀ�Zk�*yq^      s   �  x�uW�r�6}�O]flG���I��$�Rˉ'��@$$aL*H�Q��$A-Ng<c�.�r�=W��f#�D��T�s�_*ꓙ\k�~a�|�T�04 B-�؃UEC�O��U-s�Q�4"�<a�|��[#qo�IErm�*�D���=4�RV+��4%5��ME3�(K�j�Do��G��kv��JP�#��F���n������7�L
�S�*U͗8:ǩ�Q�\�Z�Qx1�?���z�.y)ܕ��=������52��W[�ȅ~��6��
���y����78�e6f��,#�78ʍA�a�X�{��\��R�rxX�G�i%س�(į\X,�`�����O���BeL����V�Oɸ6���ȵѼx���}�lM��(������<���|Vz��AD&���`����<H���M����ABn�AY�é�t�k\��q.h8"S���媦�7�|mt�a�}�V(�+W�����y�V��5a�;B�Ȃp�ao���'�EONg(!3ݘ\tlӾ �A��J�y�&G�h4"���ky}��#$��0r�A[���f�[P�(: ���������4��Ek�&���k��F	y����� �{��r�xJz��=��F�!Ol����xdkAc�\�ܜ��i�6'�{�����EԎ܁�I�,�4v��W�ƑK�KJ�F�T�߂T���	 �׼bw�� �8="���GlOJ?8�Gnd˩g�&�~c�X��*�������v+
b��F���4�Ȭ>c�*z�֟w�����߆���F��T'���9d��~m��F��q/��u�'Eց�[��J�i���4<pk�-@�o�Am��YRD��ƝMr	������ ��q��x�Y�ȕ6��8�9Wv푋����Լ
%KA3�ܡ�"�Y@�����rY�gl�,�-c�<��3r�_��gHY�{#����"m���܉7W����Cg@�?��6Y��+�쓨����Ȫ��S^ïS`��8�Ŋ��H@'\��G��-��`�Cvp�>�:�Tbq�"4am�+#�%�
�D1%Ҫh��
�Q�BU�4p�٦��C5�fm���ǋ��:�������t�b��T�7h�r1��uͼG���#
6>c�2x�{����>��%ߦ�@M�d�-,}r�(.�e�y%뭋�d}��������ie��J@5��3����A;?�D�ɯi�.�g)�i[��	�5���CW���
�K0xlj��y�=x*�v;���>�h�t<�3o�7��=��e�k,br���P�Ə:�+�M���������� ?pc���d�X	]�޹���@h�vx���.�f�R��f�r�HB�7���ge��as�j/r��N�|>o*L 6�ȩ�yz\�Ր��tzyǦ�K<Z����n�����E���k
v�}K1���AT=�������9��þ��XJ.� �UvԮ�G���������`���SM����M@���O����W@z;"�CL��ޘ��ᙗ/�|�aj�sp��������k�ƌc��l�s;b���c�Ӈ�� �������-���)�E�7Ɗ7�-�;�K>f��c�M�|�5�?���I�ӏ�a�e�IG�SG����?)�V         �
  x�5�Y��:D��ż� M{�����I�F���-��4��ύ��xƎ�g��ĭ'���3���O_��>��u=��3��3J{ד�ѱ�H��Y���:�g�����?Bߵ�&2D,�s�=�R{�y��y��Y[#�U�>�t��Qq��������h׍\���Y��xRk������\Ϯ�S;������}z�$�{L�H0�֢����j=�V)C�-MJWi���M�����,i������EWfӪ�H�#s~�,��6-��{�����g�c耦>KY�gG���g��f>r�|K�AE�_�����[�c�D]���k�'b��Y�#�bm-)�)�c�m�7)�'"N	�H�#R�*ZBbc�}����x7�8^I�|6DdL�[��]��l��2��vP��!�W��r�84dI9�`Qd�l(g�3�ލi�r��X��(�처�a�H�|DAx%�'D�����N!p��^ĕm�i�i��#�b{��3ౠwڛ�\�"�kC9�
68�0F�#�r��m�<Z/aUd��U,�&����6�E�π����39�L�1]?��z��X�@���CԼDC��2��%�j(�� ���')�WG�#0������XC|� !c�IoB��}A�Ա�|�Z�"�Ll#n�(�K����^eL#̀���L�I��I�md�G�0-���ӻ���� ��-1���H�AZ}Ih�
q�K��|���r~�z�8���#��:V��M��ղYA+�ӚH�v��(r��J�#p_�#���ǥ<h�/������?A�iSHAy^�Q�2��ed�n�\��/�f�\�� �H����X�e��eCG�2tz!!e	�G�e�c�FCi~�����f3��wby�$�r�o�u�eo	Z\�` �"[�@	���~MU����nX2"'{�Ə����|ѱ���T�t	��9>6�o�� ^��bʢD�W����@�0��Đ���pm�H�f���g@Ѭ���ʘ�T�M>o��U�K?�����u��	(jXw��8���A��,-GN�(�-$�J��, :_f�¢���d��&�/iZ˽͵�B�:@�2�/9�E���pP��<zF��Ψ� 󎑒]I^U/@(���	���	���� �		 Od l�\\{��ē��Gm'6�	�N�C#h�t���v�."a��}X��KG���C���$�iҍW۝���	�����p�w�FrKI.�<`�	�Ku�:�������}ѡ�%�6��B~.��%�(r�:Q�d!�E��V�,hW���)��}�Q�#q:4�ԴKۻ[
uK�6iK.�2����2�Q�	[�[��Q��[�>�9�a�|^ \/LDL�^mIj���G�Z����-��n�	G�����T+���+���pC@-��4��� v���^��A�C�m�ѹ)!����`�0��G��@c�(x�<��#����0��ԇpD-�WLI=���?p���@����ӁC�׉A@z;�m��r=����j%eD�K�H1�s���y#-ݜ�$Ƿ�:��z���6��.� 0/��/Z�E�㙸w�3���@��AL���_Ӑ�����]~�߭?�0���/׵�UD�s�9���gi$����.�)�h_����DE�~�����$��9��+�.����c�@���3����$��Owx�O�Pk)���ߌ�c=�1n�q��p��+i���#�Kf�$p�����!���2��{FQ���rO� K�	o��H}����c'#�K�s�ha�%��ݘE�n�=ć��x2�6~&��zX�g�e?�aD�6)��u��;,�[�$����#2�ރT2��U�by�6>�xK���z��x���o� ��w���]o�_��p3������˶WH�ɜ��r��5S��37/=�����דj5D'���/Ap�#=�F7�'=]��6y����@xǭ�*R>���8�w�0#��d��i���&�,����# ̜�0܁�m�-Z�/ە�ټ}�0}yz�n�WA����ߙ����@���֍v�8D���V��	i̍��1��q/�i���=���w��w�+R��7�1�M+/�^|�B���� x
�2{Qv��/�~�hf}��	�
�@�]�B/��E��~�U������3�ַZ�Ot{^&{|����z��]U�[\s��o�v�x1�٣{�����\ܲ_�G;�q���Ӏt�4]���s2��q��c�dH�)��Ug_1�� '�ю�(��~pW1]��q�9����[4�`ǌ��V�8��J���E��<k0��k[v��Ӱ�y)+�ox�g�����E�����K5�#�D�m�7 �0`�uۧ�� [y���'�L��g_�y�(�p�<}��E�s��q��.�+$}�U4���޿f4α�Dݸ^F��"W�����/���۟֢�(���jJau5�~��::���D��ݻe����w�/)les��!�����[����u���v_#��+2N�8ͫg+��E7D��4��[N�-@ͷ�%���}�tp�i�E��_�ZE�,)<r��N����N��M�ӯ)�.q�I�|uܽm�>}�RN�c��^ 2�a53���}�W��pH�48��5^p���"Jr��^ݮr�/�9�K�)s��?�������y      w   ~  x�uX�r�8}��I�R���m=Ifrs6{&5S�G�K"]���{��lY�Vʑ�2�F�9�OC�y;���m柚�K��fv�V�M�4O������a]��c�p�^�R;g
Ů��&������e�lR���;YٴZ�_�����L(4����m���u�ާ:������>4�J����JN���%�&�`�+�R��=�w�Jl��j��e���q�t��Qq�(,{��.�O�}���eڴ�)�ocXf�K��*W8��z��m�'�~[u������"�D�>�B�LX��yv��?r�7y�l�r�`y�ܦڄ�J�S��Ɗ"�7C�������V�٨i��[��;˨�("��Z��TY��]Z���<�e��tQ�Q�XH�����>o���-Չu���=;���Ǌh�Q�R�w��/iٷi�M���;��zv�bK���nZ6��KnQ oQ ���Ō_�e�]�Sݯ��1��jS-�4�B���S[H�P�4� nj�\g�s��O	�
�т��Kîw��vA�k�-��'&�Ct�.�t����.V3�z,����봤���ؾ�E�ļj�:�.�PH���˷�%j�d�~�׋�P����0ZJ�(�4³W}�_W?2�ݥ�H�>w��["o7�f$�	����"�/t�MO����l,�)�)g��{��j�����wC�)����Y����|U�ݦ�{^�?�u���yj�K�	GL�&��
���zޞR-m!mY�3v�l��](ž�e���k�kvG>o3[�u��u�(-�+�f��g�H!�4�X��HӶk��i�A!3��2�e(� �
�$�4[�=��fH�T�AN/m�q�BY���?��ևO�wXl �t��y�69-A�q�p�3Iz!��/�4�h��k�w{r�]�o�"�^\`�S@R$<
�G�,Ā���g�Ny5�]Ք1�R��
���A�k���M@��,�X���4RZ�T��0i�Q�\�^�Q@̴����+VZ ���}"��e�IP�)�$zK�Xh�~E���:?a��%1j"���q�`2i�~TV�5��z;���_8]I�LȈ�{Yh3�1�(�c����0o�M���i�4�o��Q�Rڲ��H]Zn2��J�����@�۱��\ �1t j�co�y�rT�N�	2�a�3i$���&��4�R
Q�T�=�#�۪~��:��_}V�`q����}��L�=��5���AX�~|�a#�
����nqγ&��o7���nO��h,�R���mro���z8P!�W��u���so@:#a��7���k�ņ�L��4��7���Hc���g�`������L�.��R�D�_h���O�,R/<��WΘ���ߒ��w���C������ޔ2Z@b�^�zr	��B�w� �:��6�0��މ8�G�.h���= ��ua<�w5�'��Nwx;#�=d�_�ӽ�$	��*�1F(L r����f�������h"{3'��?.����C[�@��	�w����,�q������@�� �>o�uC�<C��>% �da%����P��}�ǖ��р]2�n�}(�TX��D� �-��6��u�7��x���Z�t�j�g_�mk�͈�՜���uw�{�d�@5�V�5��m��^4��6��R&�M{a�As-}@��`����t��N.l ��m�?&�C���@����%�I��3�=F�Y�pF ��/@?c]a=���-�jǦϬ�<Q;	9h����J���um�=74.z�I�l���O0�^u���C�ҟ)���1���h�!'Hiެ,�<?�}����Ļ�)��|NFS89�hK҉�0D��\�)-����ٵ V�p�᷄5���L�W�>u���%��H8���BN��|h���ؾ�v��99K5�8������ϠJm�yy{������4����K��$��#&]�/��/��=o��s�#��Ac���`�a�Vy=�%�@�>�����������㳵��f<���]���������؋���߻GL���3N(%��.��G��~�P�v����A���C�+�|�D�%[�	���a�����{����)�X�d�%*x�ۤ�>��íP���T�5D$C�b70s��J��v7��Β�S���$��=5��aHn�bq����0�ɣ�Q���O����N��C���3&CoAț/�e����t$Ϸ���@��3����P<���$�������:�~ ���;_�����EJ���Wiׯ����o���O4����M��i,��L>��4�'�����w9�3�@̸��d4�������ρ���R.Hu4�i:�dq�q�����0 �B)�TǢ;y+�� �->�+4���|L :e���Dn@H��%��b�У[ w�0���ۓ��SF����.�fU��cҎ�WaE�"��\���)z�e�K(��3��݌�g�C��A�R*"Ys��F]�>���pߎ��, ��V�?ӖcG^��C�g�2���.B�{*���'�!gx���o���[��9'��2!����"��=��(d��-��4Q%"�*�c���u��"�y5m�>�� 4>Q@�W�R����i)�@���`��E��:!/�ȣ]�S���5�R��)�:�'Hӣm�F��fx�횞Hv��|^U5�#��)�M4�ؔ�g�i�	.���E:����ly���y�{B���a���Ed?ZvhU�Ϟ�h�ж�w�xV�����"Rc]���΀���S���cSF��-zv��W45T�ġ��_;N�J���=�z���a,>�^[�G�S�$S�~,�g$��0�O�k6�yc?�5Y"K�Z��W�����V~wwb�������a_xţ��;+���`8     