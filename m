Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEB191A013E
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 09:23:28 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1448317404634836.7660609874773;
 Mon, 23 Nov 2015 14:23:24 -0800 (PST)
Date: Mon, 23 Nov 2015 16:23:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v2 1/2] Add delete for error logs
Message-ID: <20151123222322.GB19499@asimov.austin.ibm.com>
References: <1448304023-25309-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448304023-25309-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <1448304023-25309-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151123222322.GB19499@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Nov 2015 22:23:29 -0000


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 01:40:22PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> diff --git a/event_messaged.c b/event_messaged.c
> index b5d3ff1..15412d2 100644
> --- a/event_messaged.c
> +++ b/event_messaged.c
> @@ -14,26 +17,17 @@ typedef struct messageEntry_t {
>  	char    *association;
>  	uint8_t *debugbytes;
>  	size_t   debuglength;
> +	uint16_t logid;

IPMI uses 16 bit log ids, but do we need to?  Can we just use a size_t
instead?

> @@ -105,9 +86,9 @@ static int get_message_dd(sd_bus *bus,
> -// TODO Issue#2 Add method to erase all logs

Add 'Fixes openbmc/phosphor-event#2' to your commit message and it will
automatically close out this issue.  (Though I don't actually see an
issue in github for this...)

> +int get_new_log_number() {
> +	return ++g_logid;
> +}

Here you used an 'int' instead of a uint16_t or size_t.  Is this
intentional?

--=20
Patrick Williams

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWU5HaAAoJEKsDR8wtAMEZjUMP/3ORyHWFduShy4itv2W83d9Q
VCRI4EFxop1Ahann1NFoHBjsv2W6gIqEqS0PqMrU2a4/THR89bo5Zxpx1IbrrG6h
amUdrmFQYOS1KuqVbCipqOou3DQvvyqYE7XtRLEcDK7d4DbcceaQ+ZzNyRC8EgkM
wf132z4VwIyGx3UQAKYRL+Lfo9a1IRmOSu+I4Qmgg60qMhOuUNtFhgLH2dpod5GQ
rUnxirxJLO+/vj1Hg3bHXxyAQPDlptEjYtR61pYZksEVuSSq+3DsC4ESBtBg+9PC
yTW9dMVjGAsZ7eCcbuIyjrWXr8Hr6gPdsV07trQxJcTdb3CLFYqZQeOygNTOGAZB
RX/ApqWIliHdOf/NKTal4HnGfRLi8qy+DemXdQQDpytY/h8R5gEPGlhrVDBUOalL
VZYgGbuSD9ISDzpXgE3Wwft6oN4uJY3p6A26XNn6MRja3qJlLQ7yN2vE8GX6yuKr
vwxBPyFiiq8mVn4LNe1zhgMf+0hFdz/5jAhBUZF934YToPeljvSAoS0gZpHoIAVr
/9GCw1yEkboY36/d+t+ljdOAlIHNRx3iz5yl82pB1gjvorEi5ZiTYqI8RNn/4dfT
WsC+lSZwRR6d2ePxZwPIJlIvAdjuhuwwwk+hIN9MElT6DwK0z+XCOdFZElsTfoHZ
eh0BgvjbR8JkOcrikSiY
=CYOa
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
