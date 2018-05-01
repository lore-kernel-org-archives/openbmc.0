Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pa2oIYit"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ou21FUyr"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40b4sY5cLHzF2Qt
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 01:22:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02148227FA;
 Tue,  1 May 2018 11:22:35 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Tue, 01 May 2018 11:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ZTBKJhiq517XRkge3zPPzJ3ei8FEb
 3Q3kI5aMKdRsO8=; b=pa2oIYit68uofT+V3QuO6KA9WsUbDr3wchqSe2It1csco
 NNdHvRKnU1PHW3mHXYEKvjGqiy2MOMwc/+mB1JI1rOUY8H70A4o+xcZJ7eilS8cC
 acvNpskkfvJxa17DlFtu4LM8ddr1+hRyWKCh1qdOW+8MR1E3jM4/0LVSQ8z1Wrd0
 tUEhj3REK70JYjvcP2MHqypYWeTyHZQZ/iT+2mvx1PyyJCT9iRsOZf2rmsMX+irP
 2uFxXypLbvkYOq/+h4V9ruJGcLWp9t+C4KUFKzOzr+FnA0NCgUgWzSum+jxApWBM
 Dby+S8mE3JUrp7EaVC9PNzbEFs3xCpePsZzcOxxEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZTBKJh
 iq517XRkge3zPPzJ3ei8FEb3Q3kI5aMKdRsO8=; b=Ou21FUyrbLzdHg7mERuyyO
 OiX6sjbVYKW6Z1F8AkN0fOHXlYUIY2vduof5Y5ouFPkuFEaiqF7W2T0vriGbkE8Z
 p6sk4ocLOQDKiflqK/AaprTYEiHCvvTfHbRnyW1CoQlX3cudBBaRddmWD/4cXXTu
 BI5VXYg7SWInPr585ZwozHbWQ3Wuh595JIClLoixpOwUJ0MsdMT5US2ow6TJpz7l
 wHTkZQVObfNGUzCySSzuyIW5DKC9Rg86EdAV2Zk3G54+I8+lLXmnTSf9F2M4mqTv
 EIYte8oPz57n/PjVFtgqWVX4T0MpS+RqQDtmdWIK6Tz4ErVgIZgU1YqoDPZ7FXCg
 ==
X-ME-Sender: <xms:OoboWjTz5nGebuh5KvswwRJcL-mY5x_uE_IqArK1NwH_ZA5uozkLyg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 97E0640FA; Tue,  1 May 2018 11:22:34 -0400 (EDT)
Message-Id: <1525188154.1335684.1357004960.49BC3482@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-62b61488
References: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1525131849.252145.1356261360.2E85A1F6@webmail.messagingengine.com>
 <beb636a9-1c09-8b9f-e839-97d7743bda20@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.13] fsi: occ: Add check for OCC response
 checksum
Date: Wed, 02 May 2018 00:52:34 +0930
In-Reply-To: <beb636a9-1c09-8b9f-e839-97d7743bda20@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2018 15:22:43 -0000



On Wed, 2 May 2018, at 00:10, Eddie James wrote:
>=20
>=20
> On 04/30/2018 06:44 PM, Andrew Jeffery wrote:
> >
> > On Tue, 1 May 2018, at 06:35, Eddie James wrote:
> >> The OCC specification indicates that it is an error scenario if the
> >> response checksum doesn't match the sum of the bytes of the response.
> >> The driver needs to perform this calculation and check, and return an
> >> error if it's a mismatch.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> >> ---
> >>   drivers/fsi/fsi-occ.c | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> >> index 45ae13c..16f18df 100644
> >> --- a/drivers/fsi/fsi-occ.c
> >> +++ b/drivers/fsi/fsi-occ.c
> >> @@ -427,6 +427,27 @@ static int occ_release(struct inode *inode, struct
> >> file *file)
> >>   	.release =3D occ_release,
> >>   };
> >>=20=20=20
> >> +static int occ_check_sum(struct occ_response *resp, u16 data_length)
> > Why pass in data_length when it's been extracted from resp?
>=20
> So that I don't have to convert it from BE again.
>=20
> >
> >> +{
> >> +	unsigned int i;
> >> +	u16 checksum =3D 0;
> >> +	u16 checksum_resp =3D get_unaligned_be16(&resp->data[data_length]);
> > This looks like the definition of struct occ_response is broken:
> >
> > struct occ_response {
> > 	u8 seq_no;
> > 	u8 cmd_type;
> > 	u8 return_status;
> > 	__be16 data_length;
> > 	u8 data[OCC_RESP_DATA_BYTES];
> > 	__be16 checksum;
> > } __packed;
> >
> > The checksum member is misleading, as we're not always transferring 408=
9 bytes of data, but it is necessary to "avoid" an out-of-bounds memory acc=
ess if we do. I think it's worth redefining data as `u8 data[OCC_RESP_DATA_=
BYTES + 2]` and dropping the checksum member.
> >
> > Also can you add a comment explaining why you're doing an "out of bound=
s" access through the data member by indexing with data_length?
>=20
>  =C2=A0Good ideas.
>=20
> >
> >> +
> >> +	checksum +=3D resp->seq_no;
> >> +	checksum +=3D resp->cmd_type;
> >> +	checksum +=3D resp->return_status;
> >> +	checksum +=3D (data_length >> 8) + (data_length & 0xFF);
> >> +
> >> +	for (i =3D 0; i < data_length; ++i) {
> >> +		checksum +=3D resp->data[i];
> >> +	}
> >> +
> >> +	if (checksum !=3D checksum_resp)
> >> +		return -EBADMSG;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>   static int occ_write_sbefifo(struct sbefifo_client *client, const ch=
ar *buf,
> >>   			     ssize_t len)
> >>   {
> >> @@ -692,6 +713,8 @@ static void occ_worker(struct work_struct *work)
> >>=20=20=20
> >>   	xfr->resp_data_length =3D resp_data_length + 7;
> >>=20=20=20
> >> +	rc =3D occ_check_sum(resp, resp_data_length);
> >> +
> > It's a pity there aren't two checksums: one for the fixed length data (=
covering the variable data length value) and one for the variable length da=
ta. We're pretty much reduced to inferring that the data length is fine if =
it doesn't exceed OCC_RESP_DATA_BYTES, but that doesn't mean that it isn't =
corrupt.
>=20
> Well it still works; if the data length is incorrect but less than the=20
> max, then the checksum won't match.

Maybe: you're defining where your checksum lives in terms of the length, wh=
ich is covered by the checksum but only if you've found the correct one, wh=
ich you might not have if the length is corrupt. But it's pretty unlikely t=
hat it would pass, and a checksum is probabilistic anyway.

>=20
> Thanks,
> Eddie
>=20
> >
> > Cheers,
> >
> > Andrew
> >
> >>   done:
> >>   	mutex_unlock(&occ->occ_lock);
> >>=20=20=20
> >> --=20
> >> 1.8.3.1
> >>
>=20
