Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="uzgpkjPn"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcmbv3RfXzF19r
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 05:16:26 +1100 (AEDT)
Received: by mail-ua0-x234.google.com with SMTP id e25so3491643uan.5
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YwyoHnSk0jkx7RqDdSwdrXWSVbAR4LxQUlJ3gv19kZA=;
 b=uzgpkjPnVzflrO/q2UoY3GsjWFsQO2DAKjNp/NkDEZ/8JXtqx+Z8f7vVMTyUFhXl79
 oRgYAf5TyAQxG+x2NL5IZL1sDSI5f3UbAnjssHv7iWegiN6I/iC+VoEKnSRx+nvUEZuc
 ZXf9nN52zGU3LLM3BPV7YopplVvNy1Kd9xIanZc7LpIp0OmjFPXGPZSdIHLNjB1f1RAf
 HJVtuf3/VyH0i2zdxKpg9v2nUmVloE7zrNp4CWefzLa+XtQohlXeba68ru/im3cTqS4c
 Ud+MW7bU58ei8H6DibPOYFVDWx2WCUAMUyjIm3ztrRUP96vIQtY3nyLtO74PoD+W2u0s
 /E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YwyoHnSk0jkx7RqDdSwdrXWSVbAR4LxQUlJ3gv19kZA=;
 b=IBhxtMxte1hEjQ0Nop7XorFZE0w4DpfqqlQrKJ4h1aNAbRJ2LgR4a7N5cXBgpdTrpj
 /2AlgcB4v/CdayNJDAftrpVm8okTd37mOzWDlOSZ1yH9M20iOq98cLt6fNiaPIGBy5gL
 lBU2M1boIqnKCShX9FYgs87Pup6b+S24snVS2Gu9so6HcFerTUI6jhQ4T0Qko5vnrz3Q
 6TaxWuyqcoB6AHFAcwc1Wg2o0S1BhtlTdGUTl2lb+7LzVHoc5tiXd57gShwMJP+m/9ty
 iB4txwT6bWrmXIG/YAllxvXJ8QH0jmq9S5L9nSIMVrlwhYow5S1HqLWYvd/DgyIivhyr
 OQAQ==
X-Gm-Message-State: APf1xPCjirKN7YBhuoYKk7X2MB4aCa5WgfcqWevFUMeWZy6hxSNQHMw4
 QtPNRoUH8tC3i82hrmPY67egB6J6X7k9NXk+buxeIA==
X-Google-Smtp-Source: AH8x2261E5f1gbHOw+NmHCFLhc/WIiUxcYOUpYbAUWlCm3mbb8EOanE93QFOxzd3Pt4uvPcXwwGXJrXMPHvdMZh+dHg=
X-Received: by 10.159.60.8 with SMTP id u8mr85334uah.156.1518113783951; Thu,
 08 Feb 2018 10:16:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Thu, 8 Feb 2018 10:16:03 -0800 (PST)
In-Reply-To: <CACPK8XeSdhqMYhEug7FCYKwgn5wDe0spvDeyR==tCEGjAoaSsg@mail.gmail.com>
References: <8E21FD04-4E06-4757-818F-E6CF7771265B@fuzziesquirrel.com>
 <CACPK8XeSdhqMYhEug7FCYKwgn5wDe0spvDeyR==tCEGjAoaSsg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 8 Feb 2018 10:16:03 -0800
Message-ID: <CAO=notwHgKGhnJgCo39i5JBszcXkHrozxEZut41ATsk7iSN4jg@mail.gmail.com>
Subject: Re: Mailing list posting guidelines
To: Joel Stanley <joel@jms.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>, 
 "Tanous, Ed" <ed.tanous@intel.com>, "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>,
 Yugi Mani <yupalani@microsoft.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, 
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "alirhas@microsoft.com" <alirhas@microsoft.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Thu, 08 Feb 2018 18:16:28 -0000

On Tue, Feb 6, 2018 at 6:02 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Feb 7, 2018 at 1:14 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
>> It was pointed out to me that the Redfish thread was hard to follow alon=
g
>> (as in, hard to read).
>>
>> I just wanted to highlight that there are mailing list posting guideline=
s
>> designed to combat this.  Here=E2=80=99s a good overview - pay particula=
r attention
>> to the sections on plain text, top posting, and quoting:
>>
>> https://fedoraproject.org/wiki/Mailing_list_guidelines#Proper_posting_st=
yle
>
> Thanks Brad. In addition, OpenStack has some good quality detailed
> documentation that I would recommend:
>
>  https://wiki.openstack.org/wiki/MailingListEtiquette

Hilarious examples.  Blue sucks! :D But helpful.

>
> Cheers,
>
> Joel

Thanks
