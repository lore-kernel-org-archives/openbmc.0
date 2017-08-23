Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcf9m5nDmzDqhL
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 17:26:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GCOa3iKn"; 
 dkim-atps=neutral
Received: by mail-lf0-x22a.google.com with SMTP id g77so3722377lfg.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=gRMcF5ofFqJlMPkoSpX9/EcBHoK8HybnN/RyVXJCO6M=;
 b=GCOa3iKn5/yIywqhwOLARKOc0ingNyU0qdeLkq7ZHaR6NqqUke7cT8bZqHsluZvVqX
 viKw/SLGRJ7Q30956ZZMQwECBiSbGpB75s7xGSzC8i3U7UQBfhHqbEq+FXtSzDVUeUyO
 nNAFbnts/W4T42hAddo9QiHUNA+2KDVE9wUdJiHp+AXXYps1fVB4djXlmqSQn49ojdtI
 Q2xQpjSgpLQ9o83jbTxtMJgz6kXDy5TBKXi7SO8PuCSWVqAT/XHBHhpAyVapq7uWtNa2
 r+oqRgGHypMSFBYxRiWZA+VehXCb69qkXp8CKwcSwEwj2kKcZWp4z6gAi3QDuul2uisy
 ua+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=gRMcF5ofFqJlMPkoSpX9/EcBHoK8HybnN/RyVXJCO6M=;
 b=gfGHlvj+V/tqk6X6wWsS0wiJUqklNNCbcQwSRzheeUSXnHyb7JDrF4PuOBXiDo8Xmh
 QCk4wY4Gwm7tUl8G+FbwfhVknqYB5X4HEtxCaJBx6W0e+Grta1CihMXXeViQrMjIwivI
 fKc/1c5vMkIQ6pTHOv9BQjjQ1pBbGJqbOaYcK8TSysupXKvppcisT+d9yH1RRcDU+Igw
 unFz7wGz8bB7ej5Xr2mpbMpUKj+pKZYaVr/WUSlp2BL2VSgPh/eLJX091R/rwGMOYdx9
 4OICRoBtlV7VGhhNptVMdMgH9pJXKR5Gg8jqjv418lonUpa2FaE/7yqj03KDb70BaHFc
 bluQ==
X-Gm-Message-State: AHYfb5hJKp4podvEvX7EXzzcOut4/Xd4KLfT5TYlHDJU8WUE+DOc0FpN
 S/ZZhCYzKgrdg5q/x5XWbO0Obc7AU6Xe43o=
X-Received: by 10.25.155.209 with SMTP id d200mr508476lfe.42.1503473177198;
 Wed, 23 Aug 2017 00:26:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Wed, 23 Aug 2017 00:25:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Aug 2017 16:55:56 +0930
X-Google-Sender-Auth: CUq6MmXNR32cmneDdyaqxr3kZEA
Message-ID: <CACPK8Xe1O-j_GLES1z1utTF+H8qm-u7VRD3j4ZdyLvf=U49pqw@mail.gmail.com>
Subject: Andrew maintaining kernel and u-boot next week (28th Oct)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 23 Aug 2017 07:26:21 -0000

Hi All,

Andrew Jeffery will be taking on kernel and u-boot maintenance
activities for the week of the 28th.

Please hassle him if you need any patches merged, or the u-boot and
kernel revision bumped in openbmc yocto.

Cheers,

Joel
