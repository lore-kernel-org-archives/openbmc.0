Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Johs9Sp6"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbl304cr2zF122
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 13:02:51 +1100 (AEDT)
Received: by mail-qt0-x235.google.com with SMTP id r13so4990180qtm.8
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 18:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=dD9XRRp8x9/0zradkg3v6jrLKjCxZ9Wprbb24qWtU3o=;
 b=Johs9Sp696XKcCq2JeS6jx8WC2xgZBe5s8Rz8c+g+KVKZL4svu5MUwnycjF2O3n2Sm
 ZqEatuq7vnqG8aHckzgqAejGzd6TZVpQdfpZCxvoHjI/7mcsoYSS1v1sEPcMdsu9bY9N
 /qx2xfIj0jB3CaduGXIkgih4Tpvcp48Aw4TGrWxnHf6BrwjZ5XbeuMWr4PXyU5D25dWH
 OkkRjSBvAR4pDEL5Mp342ihEFBNSq8S1rLEZrftmn6spatZGHHa5i9tDvILe+77e/ZIQ
 j0lpeQT+a/AH0IaHLcZL1otgcZusF3vg34eTuSYJNvhj12mWKRf5U+DVqMeB+J/o2+A/
 widQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=dD9XRRp8x9/0zradkg3v6jrLKjCxZ9Wprbb24qWtU3o=;
 b=bbJno0MOQgMVq973xwFQuA2HTiCjYqiik/qC4K832OZkdnC4ZjFbPVaQCBJAjSG6dD
 IRzEQzZhDJiBzw4FfiPW8rzW7mgbfhj6KnUYdLeM9Jt+YC6CX3dXb1PoiRBJiUDzr2Va
 BCY6lnQTdKr0C0t98LTpNjBFUYtUWkiyVhyEs2TlEQNA0et54iyw3Qy47TtJOqL92duN
 Ss+V77H5gY8zoytDp5v6kMvjjBsQ7ZCRutHrITM+LRzpc0ISG3B5IB5JfdCCWcU6nRpr
 1DoGcmLQKsrpZtixilbQ1f9Ws09YQGM7oop8vLXxQn5xWJhGO44MrchJYqEZFIQElABL
 yUGA==
X-Gm-Message-State: APf1xPDXGRgu9pVdtIHtwfEfLUEaRVrxYHvS3lFFJSyI9BQlSJ47bJns
 0ZonsnKrS82KkOf8pz4BmJEHO/Pkuk2eFPSDze8=
X-Google-Smtp-Source: AH8x227oStafeTUkmctLzd9zpNLBhPdRbIOiOX4TKpmgOv8jBYQBYGsFXvEZE/S9ayqw2U2altZ+gCaj9IB/xBUP+fM=
X-Received: by 10.200.36.199 with SMTP id t7mr6780518qtt.141.1517968969625;
 Tue, 06 Feb 2018 18:02:49 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.179 with HTTP; Tue, 6 Feb 2018 18:02:29 -0800 (PST)
In-Reply-To: <8E21FD04-4E06-4757-818F-E6CF7771265B@fuzziesquirrel.com>
References: <8E21FD04-4E06-4757-818F-E6CF7771265B@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Feb 2018 12:32:29 +1030
X-Google-Sender-Auth: 6kGXHhIPUCNCyIzYvt5OkmGEcgE
Message-ID: <CACPK8XeSdhqMYhEug7FCYKwgn5wDe0spvDeyR==tCEGjAoaSsg@mail.gmail.com>
Subject: Re: Mailing list posting guidelines
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>, 
 "Tanous, Ed" <ed.tanous@intel.com>, "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>,
 Yugi Mani <yupalani@microsoft.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, 
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "alirhas@microsoft.com" <alirhas@microsoft.com>, 
 "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 02:02:53 -0000

On Wed, Feb 7, 2018 at 1:14 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
> It was pointed out to me that the Redfish thread was hard to follow along
> (as in, hard to read).
>
> I just wanted to highlight that there are mailing list posting guidelines
> designed to combat this.  Here=E2=80=99s a good overview - pay particular=
 attention
> to the sections on plain text, top posting, and quoting:
>
> https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_sty=
le

Thanks Brad. In addition, OpenStack has some good quality detailed
documentation that I would recommend:

 https://wiki.openstack.org/wiki/MailingListEtiquette

Cheers,

Joel
