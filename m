Return-Path: <wangzhiqiang8906@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nUXS3oe/"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 433m8Q5y4PzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 12:16:38 +1100 (AEDT)
Received: by mail-it1-x12d.google.com with SMTP id m123-v6so7431334ita.4
 for <openbmc@lists.ozlabs.org>; Mon, 26 Nov 2018 17:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BVsA0UAI0EqA4weRvoUDaCpit8VfzKdZ2kosTak2/KI=;
 b=nUXS3oe/dIHlLw+qC+OfQK0+VU8UaHtViyVChs9VhbjWsLW2qfHdGpV1TmYTI1GUzH
 KAHDlx6D9rcvFl89MCabVt5+pq/84lDy19uRZiKzebRA8PMv9frNVWD+A5eS0LdBVUa9
 TjZoExzB2ywT/TYjOEHb8ZD2QtzFy4yK24XO1OVaITVwWrEWlqL4pgL9V+eXxUlg0eyD
 qm3ZOElhJLMj+k061JAdjiXAaeRII14TiUWbtY0Ifu6m/B/+lfbzOhbBRdh/oRLOY6gT
 0QhkhqQZz1LllQdHrfHkdJG2PNFUsuKKFOho+FU0h0fFYl6TFtRjAeTnGLezQeASPklw
 DHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BVsA0UAI0EqA4weRvoUDaCpit8VfzKdZ2kosTak2/KI=;
 b=qyAGjMk0rTbJ8yINt4rwYNvWs0gokWTq4A/TkRP57AtpuME8MoQ+1W4OXSOR1UEZSr
 Vb84hHnisU64axiyLWDxYEfCPjq8nMFhl6YUMop28htW99RwqDqT9zI/JpD6HHh/Cw6+
 jZkfzVhMLz8VAAT+EvXmMywz05MTVkBZp9qeI3I8KC8kEuTJcraoNo6NjJn5JhIAe/rn
 /4i0MkJR6WFQLthSIPbpZKGTQOSn42KA5aNJgFXBHeKVKrXDus4ZBrmF2rCsT+xbSiQs
 ucKyHQF/aOYQXL3irhothcr/vUdx1np3fhRzw4WNZR8tieUYN0NVPXMjUwbADGSkX12X
 appw==
X-Gm-Message-State: AA+aEWY9rrH/G/MWS5BTi7822f7MCasd6YcUiqpnhaifDEsga8Qz6Yx+
 DO/5WlLWZIalcskrtO0HkkE7Up+TZCVwAJ7eA8U=
X-Google-Smtp-Source: AJdET5cLBcUFcY0jd1f8LlHjqmPmWRcQvNPkm9A4DUciHYnQUf8VE8c4yxfWEZ6Ud2wDyBSzmM1F8cebY3gWDM6uIVY=
X-Received: by 2002:a24:41aa:: with SMTP id b42mr24513737itd.148.1543281396791; 
 Mon, 26 Nov 2018 17:16:36 -0800 (PST)
MIME-Version: 1.0
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Sat, 24 Nov 2018 09:16:10 +0800
Message-ID: <CAHkHK0_HJjKrUCsTm69iW2Hyw4QRTYYhVWxDTve5rRaLt7JK5w@mail.gmail.com>
Subject: meta-inspur repo
To: bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2018 01:16:39 -0000

Hi Brad

Can you create a meta-inspur repository for a couple of our machines?


thanks

--John
