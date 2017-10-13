Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HtwmHwAO"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EPKDZz6M"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCwq206p0zDr9V;
 Fri, 13 Oct 2017 16:13:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9383020A94;
 Fri, 13 Oct 2017 01:13:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 01:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=kwQR7RRx5npyESav/7d9cYTbwi6qe0tyhSJXtNaDLLU=; b=HtwmHwAO
 xma/hMn9cwXdWxgj/HZAZKRVnsj0jOGCu1eR6ltHQeFs6fC1GHfedb9avxwk+OLL
 Cm265Uqi5dsQcJ6+Qgj4WNt5dhyj6UbDcBq9jaIgTLbnToCqPMgeRdTm8ZPQWeE4
 Cq5WmD/lRAs7LBY8IEXSFASj0aR8kmgPMtyfgQHc7C5baCUpIhMn6QpvoZNAzS/a
 u5jlA6/vKEeN+Bhiv5ymDxTbWhYBx1fFbxUVrcYlHZ2zFVdYHFacOi1jwwdz8fVI
 JilnTUA73vDxCwP8AGJpxcPvJzQkkuxF6QuXvH1b0eD8UOiH8NY5hQDilt0lhEEZ
 yO0jjVPqmxq0Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=kwQR7RRx5npyESav/7d9cYTbwi6qe
 0tyhSJXtNaDLLU=; b=EPKDZz6MgyzKpsOTmyDd3QO+TBfYjr6RHwnH/HDOw4QNZ
 0tTfJRrTvPjQ/njTiuykUPXoDNM2/eJw9tRWIj2qcdG4tjbXholvlcjot95aaOpC
 N/Zy9qxm4p4eMxnjYXomAbrF7jbbcYZKOz624r3+zqmF2i/mBMI5BH6RD6Be33t7
 3b8yf6hxuP2XOf2KMxdkLlvBYVDAe7Bji3dlub2A3AKhL9ndYds4QrZ1+gYiR4cH
 TPMXgun9xRxQj7vyeFzQ6H6+1DZ3vxDqb3ZmdpuaUqCCeWVyAKOLuACBKB2WHrSi
 zM4AckXojXjiYqSpl6ymaabTWAkMctf09M2A4gAcA==
X-ME-Sender: <xms:e0vgWQfhS1sBqjVv_x0v-Fz6PfIxSq0A-bchyYSmRD3ZMIzFmHWrxQ>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15BC824141;
 Fri, 13 Oct 2017 01:13:28 -0400 (EDT)
Message-ID: <1507871605.5452.197.camel@aj.id.au>
Subject: Re: [PATCH] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: wak@google.com
Cc: cyrilbur@gmail.com, stewart@linux.vnet.ibm.com, Suraj Jitindar Singh
 <sjitindarsingh@gmail.com>, skiboot@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Date: Fri, 13 Oct 2017 15:43:25 +1030
In-Reply-To: <20171004004520.18593-1-sjitindarsingh@gmail.com>
References: <20171004004520.18593-1-sjitindarsingh@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-s7HdPPeEAq1fsUUhUWMs"
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
X-List-Received-Date: Fri, 13 Oct 2017 05:13:35 -0000


--=-s7HdPPeEAq1fsUUhUWMs
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

William - any chance you can ack/review this?

Cheers,

Andrew
--=-s7HdPPeEAq1fsUUhUWMs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4Et1AAoJEJ0dnzgO5LT5SycP/1g2XTHbbb1OQKJ0645G8Nc1
tZoxrW6aKpcobreKtgJmhxu8mhWXuXOo/1Bv/Ho9/A/wIG4UpYBTOv/i/DG1u78O
RzdSpcvbabiBMksI06yy/bcSlr4zsc35IBHMptAJM6JlKdhamGXy/zmJWJwGnEbG
qgsBP3ERYwNsbgDBc+JcxKkAxFCRR0+u03KTSgccjhWBqCRGqMOzzg8Fc1Hp6bEA
TLzUq746NgFGqyXAO40IPTHluTgo87qLsJzyhpdiD8tDqd0jFAy0fIpwwVnORKeg
TbajYBt8nDo3lpYG4lqhQ0pAV7CwuRSz6r+DrO/qPHjN5iTvl9OKH0mKlBP2icFN
OhtJSnxrF4E3G7P+LRCCue+7blx9VdpyxbxQTgUmXNl8YrIjf65EQ5LPnI76rufH
kYcrPkuK4u798nzE5QoEY78ijLDpbZ/136u5BgyUiZl9bmnzicKOLldiGmSk22Ho
J4BLlR0IZIGcIywATapOXO2M5o5Bo/djnlwbyxj+lblxAYeOKSfDdEcfUNOHDnhe
RXTkX/ZHxA4Ubb29t8NaFtWuO9tinhoYzeVjeTihJpj4ynUIjXM9SXgiNY1p3efE
oNPv3BhvGRzfqSx6q4FMWTo6QuA2lKFULIEQt8CqbhJw4W7LRauIaMUTkPaGLTFV
m/fLedY/bHpIKQku9+R9
=dh+M
-----END PGP SIGNATURE-----

--=-s7HdPPeEAq1fsUUhUWMs--
