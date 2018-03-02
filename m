Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::234; helo=mail-qk0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GkUqk/OZ"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cntihyEV"; 
 dkim-atps=neutral
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zssHw5tnBzF1lM
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 12:32:59 +1100 (AEDT)
Received: by mail-qk0-x234.google.com with SMTP id s198so10168434qke.5
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5LIZXD4gx5aql/zMp/vzmfBFTsz3mrCWWhlKEJ6j93w=;
 b=GkUqk/OZTrbTT7qAFIEhwwKprRHVSD0dxQRmd3xRrvzaB0K8en6dUMLouXYbjcd/OB
 s4tqUSVSran3SPSYSQPXQzHNM128DpWTt83ezu3rhHqkNNAQNtvapchqsiByhiRyp1/V
 7YvmzMt8xG0hgklxAqmprPWShvEWZrthsJDwREmpsRzvky1eEwom0RuXRMjn9bQIua8S
 nbCgQrSHGWa8zCrxnRDB7luTmD61AX3Y/K2aEz3TbvavK4KIhF7boA1ev2yxoMzz3TVv
 NiOTG0IygH5gUeF9nZtqu7iruNHdvApOeG+oUZ1Kvss2nzHg47dsr2ID19ifyow56RuX
 ASRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5LIZXD4gx5aql/zMp/vzmfBFTsz3mrCWWhlKEJ6j93w=;
 b=cntihyEVgjR0AHqgpXryWQCDo3KUjjq/jg78Gyn/nvzYnXF7IHzhYE+D0WaHU/4Ee4
 myYDWoQDeAFxivQVLVTaxszD4u9wkbx39bWVPWOUKUwAxbRfgZLphRwKiVjshMJzFWev
 jz6SmWG6F+SUV4ZlRv0U8EWKFbYww3EbR8rdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5LIZXD4gx5aql/zMp/vzmfBFTsz3mrCWWhlKEJ6j93w=;
 b=W6f7w09Fim8H+YwG4HR1mJWQWMwrMqvSVttkEEuKHvDyj8D5s4vtHyOF3GSz9niJdS
 ytFxoxQuK3KTGpxLqEYWI7EpRp2FDKCChW172LsOCzLz3mxJYYViM3Kth9pxuXHMhEDo
 RUihxsynzVb9DA3KDeD5uy5nls2veecVvXIqU26Gn85UQjv29FuGJXDqRJoTa69ifWCV
 zrpMJ6ieinNoXVP67n8wLgIr9qOtswGv1KaMLZn4QcP9D2TqOQ83AjZj1qRchC7Nn2NN
 O3HNYa7PsKy/i+EYtnp0o+zelhm3sqSkw1WRWwEkiNsjUU52yJboWfcmsrPG0rPj78dl
 e2MA==
X-Gm-Message-State: AElRT7EPde6qTsPsI1jqPFhmimKqiTXmZK05hMmO/Ueg/FQ1AqMd25rB
 onnsA+oCkWSZaFhZorJTuxIqWhXras5nF8XRj7Y=
X-Google-Smtp-Source: AG47ELuHIM5l9XCnWbwiDytNdWyHobr9anGUW34Ci6vwYN8xH7K9XAGyyEF2IDCbhNkwCvqGEIONEyXdyhnc7/ssZOM=
X-Received: by 10.55.22.144 with SMTP id 16mr5686811qkw.11.1519954377412; Thu,
 01 Mar 2018 17:32:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Thu, 1 Mar 2018 17:32:36 -0800 (PST)
In-Reply-To: <OF5EA5B9BB.74B1EB55-ON00258242.0058C04B-00258242.0059444A@notes.na.collabserv.com>
References: <OF5EA5B9BB.74B1EB55-ON00258242.0058C04B-00258242.0059444A@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Mar 2018 12:02:36 +1030
X-Google-Sender-Auth: inc3aFQbj2jXo4RzyKWR_JW3HrM
Message-ID: <CACPK8Xd8GmDB=kWn-g5g3=rJ+cws252ntbZQVWKw4T2MwU+C4Q@mail.gmail.com>
Subject: Re: patches from upstream for fsp2 board
To: Ivan Mikhaylov1 <ivan@de.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Karlo Petri <XXPETRI@de.ibm.com>, Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 02 Mar 2018 01:33:01 -0000

Hi Ivan,

On Thu, Mar 1, 2018 at 2:45 AM, Ivan Mikhaylov1 <ivan@de.ibm.com> wrote:
> we have list of patches which need to be ported if possible into 4.13 openbmc/linux branch :
>
> first 4 is for low level setup of board
> 494d82ceae7f3b9fdb5154b4469e5bb22f56040b
> 9c4c374676a12db4a452534f3347323d35c32d1a
> 50f01c57d700cce04a9dc87bc55db2e283f57212
> 7813043e1bbcea764c86ef2fcf43aeae2b0e240d
>
> it is related to network driver
> 45d6e545505fd32edb812f085be7de45b6a5c0af
> 624ca9c33c8a853a4a589836e310d776620f4ab9
>
>
> if you have any questions or anything to add - ask me.
> thanks in advance!

Thanks for following up from our conversation the other day. I've
cherry-picked these into the tree. Thanks for getting your work
upstream :) This makes my job really easy.

I'm testing your platform by doing:

 make CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc 44x/fsp2_defconfig
 make CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc

I don't have hardware to test on, so please do some testing and report
back to the list your results.

Cheers,

Joel
