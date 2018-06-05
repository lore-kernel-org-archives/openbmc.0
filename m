Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22e; helo=mail-qt0-x22e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXqYDgrf"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="EBn0HB9F"; 
 dkim-atps=neutral
Received: from mail-qt0-x22e.google.com (mail-qt0-x22e.google.com
 [IPv6:2607:f8b0:400d:c0d::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 410L0n2qbxzDrpC
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jun 2018 15:27:36 +1000 (AEST)
Received: by mail-qt0-x22e.google.com with SMTP id p23-v6so1169900qtn.6
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jun 2018 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qOelKugoP76zB2MbVLF0FEI3BuZuRWFkYtoxZCm0yB0=;
 b=FXqYDgrfQCN4k0/hbG3G8iBkZ4GtMDoa3sSKSuEX0lVjF6Lcxb1zi4Vo/04G8bYlmf
 MdP25368jtRmPrJ8sFPPlZuremdFUu0L68LYvl+wwV/KvuGnlCRW/l6ZjrSxb7ilXG68
 3SE0U262zYW3S73jPd8+QGpMcaiu7QQp/hDAL4SrZz14KuugxCtoWJcQ39XNe54ri+EY
 Flv7XnnvmWLbFQXl6Ke3QizXpnhWcp7RumNsvi8iJfkEXBsckhZ195LpVy6RRGz0GJqd
 oam4eY+yLUC1+aqOi3C/yy+mkKcTbRDo+6KSEbG/Ga0W7iB2RctzWbUEFXqJksiG2bkN
 wZHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qOelKugoP76zB2MbVLF0FEI3BuZuRWFkYtoxZCm0yB0=;
 b=EBn0HB9F7zwv3fTkkbbMKiBEn5lZ7NsiLN3ZmsiMqW64pJuMp/doaxmB8ydYHGUj6b
 0kEurb0RRhzdFQQVCa0N3LuT0+dloGkYIh6PzAYOqARJrEZEcf99CEULT4tJ+pVkfVSA
 obs0D0v00pw5exgUAQv/A/a7gb0yHmjbWbttM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qOelKugoP76zB2MbVLF0FEI3BuZuRWFkYtoxZCm0yB0=;
 b=qOsnldY6hMCYUtFDh4eA5jEZ9T71j6/tEaqjSRkdkmuszQkdjt3Cgd0vDLYCNqUxs+
 Brt18y6Iw+rTvCvChRRj8DCHAVHvFDAPTqW5O2ukeobO6fCon71COr9HkgknS8vWySnW
 miKY+ax3lOf+wZV4iIYSbvnM86SEwn1ZtZUfZRcuskVnfQ6qpy6AX1QZtdQQetz5rERO
 58ou6AS5MqohwiV4DFVIF3eoI7IRlTSiKmvU42wwqOmzkvrjB3imZTnkaugSqdNHxTv4
 RKYSARTlb71CFdrL7t9GztVMqMbLJAyIe4aPbC7u5pV9uaxr4Mu3W1bkGPeQH3FXFkzP
 X/bg==
X-Gm-Message-State: APt69E1WA1bqs9h/WTO4ZoExKLJakxAQtBD1Vd9KrB/cblit3BZd6Caq
 AwasR+S6StgztWwITZbPtPVXYi8/FEWXzyPC768=
X-Google-Smtp-Source: ADUXVKLqZG/gOk5lo+VUVEFDxB7qgNqDz0vB2c605Jsz2gaYKkqEXkgK34CsiJbwD7fDagY3/s9uE8+QTT15SN4N6O4=
X-Received: by 2002:a0c:f24e:: with SMTP id
 z14-v6mr22380944qvl.208.1528176453247; 
 Mon, 04 Jun 2018 22:27:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP;
 Mon, 4 Jun 2018 22:27:12 -0700 (PDT)
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jun 2018 14:57:12 +0930
X-Google-Sender-Auth: 8Xbkt-jCl-Gk_RsM5wwOOMjb2Ik
Message-ID: <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
Subject: Re: Hackathon - Sept 18th - 20th, 2018
To: "Mihm, James" <james.mihm@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 05 Jun 2018 05:27:38 -0000

Hi James,

On 1 June 2018 at 08:53, Mihm, James <james.mihm@intel.com> wrote:
> Event:  OpenBMC Hackathon hosted by Intel
>
> Date:  September 18th =E2=80=93 20th, 2018

Thanks for organising this.

To everyone: Is there any interest in discussing kernel and u-boot
related topics with me at this workshop?

Cheers,

Joel
