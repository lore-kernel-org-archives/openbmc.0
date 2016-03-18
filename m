Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRVRm6HLVzDq5d
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 03:05:08 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1458317095014654.3794964139357;
 Fri, 18 Mar 2016 09:04:55 -0700 (PDT)
Date: Fri, 18 Mar 2016 11:04:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, Tom Joseph2 <tomjoseph@in.ibm.com>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>, Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Message-ID: <20160318160452.GC11491@asimov.austin.ibm.com>
References: <20160309170110.GM6601@asimov.pw-on-the.net>
 <201603091856.u29Iua5p031849@d03av01.boulder.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <201603091856.u29Iua5p031849@d03av01.boulder.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 18 Mar 2016 16:05:09 -0000


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 06:56:17PM +0000, Chris Austen wrote:
> Patrick is there work needed to fix something here?   If so open an issue=
=20
>   =20

Opened https://github.com/openbmc/phosphor-host-ipmid/issues/80


>     I think the lesson here is we need more integration testing (aka warm=
 hand offs) with Foxconn.  I chose channel 1 without thinking too much abou=
t it.  Turns out they use channel 8. =20
>    =20
>    =20
>     =20
>        Sent from my iPhone using IBM Verse
>   =20
>    On Mar 9, 2016, 9:09:21 AM, patrick@stwcx.xyz wrote:
>   =20
>    From: patrick@stwcx.xyz
>    To: cyrilbur@gmail.com
>    Cc: openbmc@lists.ozlabs.org, tomjoseph@in.ibm.com, openbmc-patches@st=
wcx.xyz
>    Date: Mar 9, 2016 9:09:21 AM
>    Subject: Re: [PATCH phosphor-host-ipmid] ipmi daemon return code modif=
ication
>   =20
>   =20
>        I agree with Cyril's comments.  This code should not have been mer=
ged in
>     the current state.
>     The first line directly contradicts the comments.  Need to update the
>     comment to explain why '8' is needed now.  And removing an error path=
 is
>     non-obvious.  Even the commit message doesn't really give any details=
 on
>     what / why this change was made.
>     On Wed, Mar 09, 2016 at 01:31:23PM +1100, Cyril Bur wrote:
>     > On Tue,  8 Mar 2016 14:10:33 -0600
>     > OpenBMC Patches  wrote:
>     >=20
>     > > From: tomjose=20
>     > >=20
>     > > ---
>     > >  apphandler.C | 2 +-
>     > >  ipmid.C      | 1 -
>     > >  2 files changed, 1 insertion(+), 2 deletions(-)
>     > >=20
>     > > diff --git a/apphandler.C b/apphandler.C
>     > > index a921643..fc6c811 100644
>     > > --- a/apphandler.C
>     > > +++ b/apphandler.C
>     > > @@ -358,7 +358,7 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t=
 netfn, ipmi_cmd_t cmd,
>     > >      printf("IPMI APP GET CHANNEL INFO\n");
>     > > =20
>     > >      // I"m only supporting channel 1.  0xE is the 'default chann=
el'
>     > > -    if (*p =3D=3D 0xe || *p =3D=3D 1) {
>     > > +    if (*p =3D=3D 0xe || *p =3D=3D 1 || *p =3D=3D 8) {
>     > > =20
>     >=20
>     > So I take it that the comment is no longer valid? Can we take a bre=
ak on magic
>     > numbers or at least quote and link the spec nearby?
>     >=20
>     > >          *data_len =3D sizeof(resp);
>     > >          memcpy(response, resp, *data_len);
>     > > diff --git a/ipmid.C b/ipmid.C
>     > > index 6726a27..728ba0b 100644
>     > > --- a/ipmid.C
>     > > +++ b/ipmid.C
>     > > @@ -267,7 +267,6 @@ static int handle_ipmi_command(sd_bus_message=
 *m, void *user_data, sd_bus_error
>     > >      if(r !=3D 0)
>     > >      {
>     > >          fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:=
[0x%X]\n",r, netfn, cmd);
>     > > -        return -1;
>     > >      }
>     >=20
>     > Was this change intended?
>     >=20
>     > > =20
>     > >      fprintf(ipmiio, "IPMI Response:\n");
>     >=20
>     > _______________________________________________
>     > openbmc mailing list
>     > openbmc@lists.ozlabs.org
>     > https://lists.ozlabs.org/listinfo/openbmc
>     --=20
>     Patrick Williams
>     _______________________________________________
>     openbmc mailing list
>     openbmc@lists.ozlabs.org
>     https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW7CckAAoJEKsDR8wtAMEZWTAP/iUHLBNm7jwHX8h0FZ9+3gW0
NUllpwyq1jqmLeQvdyaZt1rCQc3jJnP/js1uIvELtg97YMql0z3QVzytNmI6qO4+
vTBZ50nm+nPclRIWOj97eFlWUIFtFdfsf7/3JWG9Yz2DX2+CCqAZOIDtkk/vE4hC
HffhAqvQ4KK6cLEeaCC88ydKZwk2QD5uebsnX/7wjPet460Bn6AIIZiYGsFkon6A
L488S33D3AHHoISWCtfsfRx3pRsKdZPIz5zEskznn81YiHTNgdOhyDBqC+quluBe
lB/ogR2OqQPBFkDyGH8AanIV44Ulad1vE8CLjL+v5eSnB86dOIvJ7GSCLSmK9t/W
Dh3KE0Px+OD30QvuqqVMhPdLWrAQP9MSRnyiGIQQ99vC2pL33t1o8iow9DZcDqF3
7+GVPObGyx3LI0Wv1CqBsY5FFIUUwxYLvPdqtz36veXPtXP2uE80F0sx9fLdRFYW
V0VXtCciXShpxWJQlvzuzwUv/E8T+VlCyoMwZcYuSgWDJFO5IRCahcnxGO/RuLgo
tAt2zftaOGzy0sKponjgM+sD7mJmSj+0kiGrFFDhMojHMqmPNggv+xjg613XICCf
SpzYyQHy8Lto6f2mclOeieR1rb1aD7Rcf1aaGIUy2yodO97e9l/OJPm5pZp83czf
fV721W19V8xrtf/v2iGK
=bsp5
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
