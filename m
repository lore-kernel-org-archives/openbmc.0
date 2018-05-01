Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ChGUljGH"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="m0fTEHh6"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Zmpp28P5zDqyL
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 13:19:13 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id f1-v6so13408866qtj.6
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 20:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=td1mpohKrD1Jn6KmV+CX3eJzBpA+99Yyu8ngXbdRGI0=;
 b=ChGUljGHhp3KyC+hjAOw75Bd6g8RrjZczLRrVHQHwVHTF2J5PjHVpqbGDyzA2eezLg
 dHP2cd82/rdNwUhIwrBz5Jwgg9+fD2YQiYOT8BMUaS+9dB8QI4+h6W2tQC+Q/yU5rodh
 9du8JdeSOpqdZgjev0UcHFMW9Sjajkqa5jJdm6Ct0qG7gWaKP6XbSUwcdcqyFJyLWTZr
 466ONG1vquCzlON0QgZWfp/1ldFbTdEAUKJAIdc6IomozWFgjLGpPhXM0aVsXzsrikjT
 LaqcpZRgY4wIM8zQNAabZH/ZuLNQhi6jB2gWeP6IwqhnV/aYJHciBPHLb6WgIpxap8iq
 MHPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=td1mpohKrD1Jn6KmV+CX3eJzBpA+99Yyu8ngXbdRGI0=;
 b=m0fTEHh6hKV21tLDWDlp4YiLl15LrvWDCWwNOfVmSNuAWXSq8SNKIstvjcdGuvjbhV
 6CmU5IcH4gc3dpnUJe6i3BK9gPhM2cvNE83yzFZee1g5BGnqtIS0dsFniTlSr+hriJRq
 JSxAfU7vFhlJU6wG2QTL7zUhBDvhsEh9XHE2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=td1mpohKrD1Jn6KmV+CX3eJzBpA+99Yyu8ngXbdRGI0=;
 b=VNSDWZUX1F6LDhHgUlP5HuIqnuTLQW87ff0zHf3U2b/9cJRfLsxGYFGSB/mr7cM8wi
 m70YYtrPJ8DYeCmZZ+JjSDM4mX13yK1Cgu5J+sDsC5pQ9xnVU3V3fsdpr1YNKnMy/tua
 iEAP6lfkS03EiTet9M7YTrxLdwxXg8IopPNzC0mlqvmWEay934J1CgM9LWgeemZ1e7wW
 KQg7ENKnzwg/buHvUcOX9PaogdCVWtDnPZ9rZbBNqUPyiVOpIaBkJI8pbysx5qLn5qVB
 kB8GGX3hM5fjXJaqmhpU/d2NiFatfs2hjsgGtKzYGeP05URiDx/XbxvGzghO/yVU1qZu
 OT5w==
X-Gm-Message-State: ALQs6tC4AtMwFOwfFPs6NmOC5EX4q5VsuaiAszp2fVekioRvyGBXa1WM
 sWub8rTUNA6MlzIjOHsaTmFGb8nYIIeRUHIpwRz3UQ==
X-Google-Smtp-Source: AB8JxZp8ruOjGaSonAUj9gLoj6goTAhBZbHkBK5LZlU/nr5OWGv+PuLu5k1xFeidlYqzGabTASSH1XB2i89OftS9thU=
X-Received: by 2002:a0c:b38c:: with SMTP id
 t12-v6mr12285442qve.21.1525144751213; 
 Mon, 30 Apr 2018 20:19:11 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Mon, 30 Apr 2018 20:18:50 -0700 (PDT)
In-Reply-To: <1525129465.240098.1356240360.493222DA@webmail.messagingengine.com>
References: <20180426021026.12548-1-joel@jms.id.au>
 <1525129465.240098.1356240360.493222DA@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 May 2018 12:48:50 +0930
X-Google-Sender-Auth: DeslFtRKG5ng9slRVhxU9TmGrC4
Message-ID: <CACPK8XehQgYvAS9hiJctdfiVQ2-f7cF=OMDNFpbN+LLUbmYTng@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2] ARM: dts: romulus: Enable the GFX IP
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 01 May 2018 03:19:15 -0000

On 1 May 2018 at 08:34, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 26 Apr 2018, at 11:40, Joel Stanley wrote:
>> The GFX controller is the internal graphics device used by the SoC
>> (opposed to the one connected via the PCIe device and used by the host).
>>
>> This configures it with a framebuffer region and enables the GFX node.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Merged to dev-4.13.

Cheers,

Joel
