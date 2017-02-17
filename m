Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPc904J6YzDqBm
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:16:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eg2YeNVi"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u68so2459050ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=EHwI04ft5KZ6MmINhy5yLRu807QBoGRI3pA30XQCKWY=;
 b=Eg2YeNVi+sB4KGZheVd4U7yWKla1wPGBdVENepxzX6sgGGRmCue6sJS6LMLT7gxqrB
 gXzllpITZo3Bs6uIpSxSClq9h0ISqcXzapjNxvhSAc+hGmd85VlDuWpZhXc7/rFbC8ga
 uusfPjqj3I4SXK9GZSZAawZdVr6t/UkRgpcj8tHQAUEpSZCIxO89BtGVLYJNFAiKOL1W
 8ob7FIbCT8fMEYkuIn28HC5nvgtY+Zmo3IyVEe/DSPu9fwzWkfxdMsRDOMJMblogLaaG
 jXVSotmb1ustqVgV0izBPNGYDpADvprNcYb9d5wyjPZ/EqMNrFUBGOgJf9hr0TF7y2wB
 mZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=EHwI04ft5KZ6MmINhy5yLRu807QBoGRI3pA30XQCKWY=;
 b=PKL7/i3m4iOc34hThvTEgAkRwbfPgxUxQ2CIYwQnfcC8RjwwvdhXvIW8clasCXyRlu
 H5Q6h6vV/4WdUUdS2AELN9M48hM3PcbvC0ryzmY2QD514pElrO0WV/cRkVw3IEIMS5iY
 evRANCKTeRwxk5OC3402OlibwaqNotNQm16KyA3Dr3vpRzKdfyO8YMeC1bj3k/vvu2zd
 GboaDecQHr9saJ7QjGFajIqc9QQehsdXqPxKduMrHotAJE36CZfvBCcVRfVhAG5K7tCR
 ntantOSoDEygr9Ny/qbvcXh11TOteB7e2CG0Mcn+uxvIU8Y+7ZIHdS9JrGxSN5FDVIJZ
 ZxmA==
X-Gm-Message-State: AMke39m/aIGy42oCVtjjnNV7wF6VMa4NiNB6aCCOly3UaOuuFhoD/T9Xh+VurKqQeWSZC9bll59WEj0MROlBlA==
X-Received: by 10.129.71.10 with SMTP id u10mr4352816ywa.174.1487297810178;
 Thu, 16 Feb 2017 18:16:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 18:16:29 -0800 (PST)
In-Reply-To: <CACPK8XdQSUa=s6Ou16rp_X=fhpDQt-hJ-cxzbn3FWZL2aDLdew@mail.gmail.com>
References: <1487283983-23024-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XdQSUa=s6Ou16rp_X=fhpDQt-hJ-cxzbn3FWZL2aDLdew@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 12:46:29 +1030
X-Google-Sender-Auth: kXvux4YaVb1oaAO6SdNi-jNVf78
Message-ID: <CACPK8Xe4D2ZRcAA3mLt_04C7Y8TxzPxFPq95_NHcEQ5hhPawtg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c: Change fsi irq enable
 behavior
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2017 02:16:53 -0000

Hey Eddie,

On Fri, Feb 17, 2017 at 10:29 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Feb 17, 2017 at 8:56 AM, Eddie James <eajames@linux.vnet.ibm.com>=
 wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Only enable fsi interrupt polling during an i2c operation. This will
>> help with busy FSI bus.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>
> Applied to dev-4.7.

This (or something we changed recently) introduced a build warning:

drivers/fsi/i2c/iic-fsi.c: In function =E2=80=98iic_fsi_resume=E2=80=99:
drivers/fsi/i2c/iic-fsi.c:484:21: warning: unused variable =E2=80=98dp=E2=
=80=99
[-Wunused-variable]
  struct fsi_device *dp =3D to_fsi_dev(dev);
                     ^~
Please don't forget to check the build output of your patches before
submitting them.

Cheers,

Joel
