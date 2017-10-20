Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ePeEsCRX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dJTcea1D"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJFMC2PW9zDqJ7;
 Fri, 20 Oct 2017 16:52:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E3B1B21074;
 Fri, 20 Oct 2017 01:52:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 01:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hBkIC/q9XzsvZODd/NCLgSzWwrOPsMrtNqXQJ5pddN8=; b=ePeEsCRX
 KQGvqfrnNqBwc3ro+cqf0PnPBtfQWGHPqMCUg43+g0XhDybQA5HIMRPpjUH1GRBU
 tBHwxGjg3bINWH7oBv7A/8bqPpnQaAbs91swxaCv9cQzIT8O9lCZ8Kif7F5Xw4Nb
 68uO9hGdjTd8g9Cn3WGiux3jJ4yzP0w3wd+mN6LSm0rMmpGCAYjIKH+vBFDoUTOh
 FxIESrpO+dHwlw3t+aSaM8K70zlNvhDWLJQpnqEwBjP85cYjvY3xuQtCnUTYP+f0
 Nyj6W6FpJQyO5wJ99BbRxHTTJvntavlWQxSoPr9+akkLJfJLF9SEx36Ww2WCrTAO
 Glh0WtLf5DmQdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=hBkIC/q9XzsvZODd/NCLgSzWwrOPs
 MrtNqXQJ5pddN8=; b=dJTcea1DqJiduONzth2ulCy6m9ry15stbZ0rJERASLVM3
 f7nZqkl2VTqk7ATHHoIqe+MeMYe1Xl6BdeBskF9wqZ0DqeclMsd4fLKo3LxltZSU
 poE0sgj8LD8Cufnu96fJ3smGFHcMfDvVcbPslcQotvaWlwbqe3ShNHEIW+ROpeta
 5Or5AUGsVymOyYqo8kpFs/hWF3gs2tND5nLdYYb625ccHLOHczUPZUpfJdjHPqpR
 DRbfA5UWdhtsxCN37xdwqZDdQBDQAs7OrN8hWeMx5Qr9gy8JSjcEUZPs0ke1ND8X
 8fbKC7K9O/9Gm7D7miXacLtbQAB3YNhOTQ09yq8pw==
X-ME-Sender: <xms:Mo_pWUxsZ8Y61FWCQVo8IiL_tua_Xlgfkr55cQseuLxvIuC_vu68Tg>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 739637E1AE;
 Fri, 20 Oct 2017 01:52:48 -0400 (EDT)
Message-ID: <1508478762.24322.39.camel@aj.id.au>
Subject: Re: [PATCH] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 skiboot@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com
Date: Fri, 20 Oct 2017 16:22:42 +1030
In-Reply-To: <20171004004520.18593-1-sjitindarsingh@gmail.com>
References: <20171004004520.18593-1-sjitindarsingh@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QULJk+SGsspBTr/UR1dy"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2017 05:52:56 -0000


--=-QULJk+SGsspBTr/UR1dy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 11:45 +1100, Suraj Jitindar Singh wrote:
> Version 3 of the mbox protocol makes four protocol changes:
> =C2=A0- Add a requested block size argument to GET_MBOX_INFO
> =C2=A0- Add a no erase argument to MARK_DIRTY
> =C2=A0- Add a GET_FLASH_NAME command and support multiple flash devices
> =C2=A0- Add a MARK_LOCKED command
>=C2=A0
> Requested Block Size:
> The requested block size argument has been added to the GET_MBOX_INFO
> command to allow the host to request a specified block size which might
> be required to allow data manipulation at a finer granularity. The
> daemon should take this into account when choosing a block size for use
> which it will specify in the response as before. The daemon has final
> say and the host must use the block size the daemon chooses.
>=C2=A0
> No Erase:
> The no erase argument to the mark dirty command allows a host to specify
> that an area of flash should not be erased before being written to, as is
> the default behaviour. This can be used when a host has already erased a
> large area and then performs many small writes which would normally mean
> many erases due to the implicit erase before write, making this slow.
>=C2=A0
> Add GET_FLASH_NAME command:
> The ability to support multiple flash devices has been added so that the
> mbox protocol can be used to arbitrate access from the host to a number
> of flash devices which the daemon has access to. To facilitate this the
> GET_FLASH_INFO, CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands now
> take a flash ID, with the number of flash IDs allocated returned by the
> GET_MBOX_INFO commands. There is also a new command GET_FLASH_NAME used
> to convert a flash ID to a flash name.
>=C2=A0
> Add MARK_LOCKED command:
> The MARK_LOCKED command has been added to allow an area(s) of flash to be
> locked, that is that area must be treated as read only and the host is
> not allowed to dirty or erase any windows which map that area of flash.
> Additionally another error code LOCKED_ERROR was added to be returned
> when the host does try to dirty or erase a locked area.
>=C2=A0
> The host cannot lock a currently dirty or erased area of the current
> write window as it is not defined if the clean/dirty/erased value is
> what should actually be "locked".
>=C2=A0
> A locked area of flash remains so until the daemon receives an
> mboxctl --clear-locked command and the locked areas are stored in a file
> on the BMC filesystem to ensure persistence across BMC reboots/daemon
> crashes.
>=C2=A0
> Multiple flash device support proposed and defined by:
> William A. Kennington III <wak@google.com>
>=C2=A0
> Change-Id: I898698840dec221ae20e33943bb28e65abc4fe37
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Applied with tags to openbmc/mboxbridge.

Cheers,

Andrew
--=-QULJk+SGsspBTr/UR1dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6Y8qAAoJEJ0dnzgO5LT5zpwQALLOBxU949x+5YsNd+KusTHl
5/tugi/+s8X5TyOnqmJVq64PgEbOjzG1vUF/R49sQGrfR1ZM9iDFpFMtNozxTmT2
s1742nRD2akK6B4r84Yj8MdNxduXMt8FJ07awQ2eds2duaqPLi4+NSKAqm/b/bts
+uCp2W+H+DVXu9KVcUMHVnwX6FWm9+R0g5JC+tzVruvfK8KdkGoRfTke5qKuMBCM
sneD8gctjrIToDBkEWcuIcQFusvbr1nu7JYUZ4mELr9/2NAoKjYEWQIdgcBCmTI4
M7fuIp3Z336b+4L54m1qimdq5rvhmt/zOBOPz6fczU7/wmjEzW9wjNUbkFkzl9Ny
cgQeE90bATxUawFtLPaO5yDmy638jg97am3nWDSZNvqTL8KeQciLdfK8qRpTDgjo
iNkJCVuC8h3BJ9vnK9HwjyYrUHfG/CPnJ9///NwThF//p1giNxi/msxldhlF7Aa1
IiOd22ByWmeT7o4lT2JZ9n7SjxKYt6A4XoVWYMl1BTkWLPutOhUQIQQbJN2s5XLw
vHP22hFKtxwWoIJnKpnyHOc1u308q7t7iku/Oz7YsLMM/BL1EXfIDq/qFBYRmZm0
wNQ5U4N2/xjZlY8oBa2LyfuRDjHICD6QMADDielMuqZbuVt0W2+3jRENdBoaE509
wkz9Nv2vIgbssOV/Ecoi
=f0l4
-----END PGP SIGNATURE-----

--=-QULJk+SGsspBTr/UR1dy--
