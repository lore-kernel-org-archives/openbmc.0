Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0F0FB1A02AC
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 07:09:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445371785265324.8327424753204;
 Tue, 20 Oct 2015 13:09:45 -0700 (PDT)
Date: Tue, 20 Oct 2015 15:09:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 2/2] Add get sel time cmd
Message-ID: <20151020200943.GO13316@asimov.austin.ibm.com>
References: <1445368857-31638-1-git-send-email-patches@stwcx.xyz>
 <1445368857-31638-3-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YS7t75H5cNTCpbja"
Content-Disposition: inline
In-Reply-To: <1445368857-31638-3-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151020200943.GO13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Tue, 20 Oct 2015 20:09:49 -0000


--YS7t75H5cNTCpbja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2015 at 02:20:57PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> +ipmi_ret_t ipmi_storage_get_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    time_t currtime;
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    // Get current time in seconds since jan 1 1970
> +    time(&currtime);
> +
> +    printf("IPMI Handling GET-SEL-TIME\n");
> +
> +    // From the IPMI Spec 2.0, response should be a 32-bit value
> +    *data_len =3D sizeof(uint32_t);
> +
> +    // Pack the actual response
> +    memcpy(response, &currtime, *data_len);

How do you ensure the proper endianness?

I don't think this is correct anyhow.  currtime is time_t, which is
typically a signed 64 bits now in order to avoid the 2030/ 2100 problem.
You need to convert it into an unsigned 32 bit (and ensure the
endianness is correct).

--=20
Patrick Williams

--YS7t75H5cNTCpbja
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJp+HAAoJEKsDR8wtAMEZrEgQAKpmvNRfS+SEZEIh1kHfCdES
8rxkzdQAo8pHbnswgiD06ryrCmsBQD2PjY9DedQabd8lE2Nf9SamGc278dmTwr8Y
gWnPuXvD83SytdKhr3LQf5KwIZJabfnnMijUGw/4XcChtwVM/M9BRGtSHwXPa/Gi
Io6kmQ7uorMdragXFA+iA3awTJjiFSMY9ci2sNUFmTeR6iqXt3sSZQ3jH/OQaUvf
+w3cGjO2IokB2WW/kn49XvNENqxYn0JwfaBwSAiP/MFQmPCWY1L//tCKoPqrodsT
IDARpienwghGwpvH+smqDMJIDb5xVENnBbBVoXpvESfCj8wtx3lN6NVOFYCTaQI7
NsOdFYctZyEn0qZ1DWmmwvt2h01sN25qdqVm1uNGLeyfv13DhGpRfD1paqXNReKZ
Kp+jlmpZuBGrVCKyvMVQKNsrAkPTKSgDAgUacJ4B3QCk5ry6W8KvnlWCHQ3AE41W
UWKzX7HlxIAxJVeiBIazQtlbNQXJ9RyrK6Io5jhuMvN34ZYuDgTzp3VtC9zrRwTS
cF+mrt6R5ym3rD5hn6fTjVHttTUpzj/VtPbcQAWafunPOD+//CMTiElC7bgiaAZM
v7xg9LCBNieIK1XNEKWNGysf6tpyJ2tP6dzikpbklrE1MwtfWxBOE2LitZO6p3Cr
JFFH25oVLO8JPhjiN7Rq
=owLH
-----END PGP SIGNATURE-----

--YS7t75H5cNTCpbja--
