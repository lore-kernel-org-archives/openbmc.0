Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPNCx2KCRzDqJ0
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 09:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="LyJqD7Wg"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id y129so13123460pgy.4
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 16:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7UIi7sYzgwYbjDOYReaKtII78UkZHe3TUJta/6qfaAM=;
 b=LyJqD7WgDTbFH/HcKHfetVoxBWIN44GWayruJz78LmO/CctxgKCNugr1CU/glgltC/
 9M4GZzVGFof6lo8HYimSSH5VHTj0OjU1a87eNzl/990lR/g8pUyVVfTFAGRIkkAW1CPb
 iQNE+INQ+0oGz4KvgzGJf/NxsDiN9UV3ywf8IpqI/edwIwkZ+d0t7wqrdrHBI+MvCoIo
 t50niCpWkHP9ymIArB6CFbYhwwPUGU2acuaZK10b3X3d1+hDf+dC/oknrR37e7Xd91Ci
 a/pCRu+U4lMg7msLU6qNSmJpxAaynesVfAPbiWXp/b4hUVyyMWH//9Ms1tCRW3oA2DXM
 SmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7UIi7sYzgwYbjDOYReaKtII78UkZHe3TUJta/6qfaAM=;
 b=rLeagWkshuIIaAz0WIwPgOe5pn+grmP/h5R6uz4yVsShXmaxWORhNF4jlmE7tXbQsu
 Sz1j9/3yf8lyn1y41bmkUNcXI6UkTpxYRO0nqWg5jVVN1yEABBrVcugQD4j256ELS4m5
 bDwiYxUbCbHjRxH7rl+4khNcE0R1zpDPhul38c7prdMgI+Lg3kkkfFlGCUh/P/0Qw3ws
 5R46juriCur8nI9fQWPXlepBYAvez0LQ0JhsZLTZTXXgE9c9PLy9rZiUMVGQhfQ+V8Fd
 dQdADblC6942BgwVjBUp2NZWbfrIhtpJYp+HUHIr30E1nCouIj5uWkDWDPnbxhd4rN2U
 4Vxw==
X-Gm-Message-State: AIVw110DjsEu87siO8rfNRwCY9LSV7zeJtp0wA9USkCKWQVm1/WcaaN5
 qo1XNdW9qhj+FCut
X-Received: by 10.84.225.129 with SMTP id u1mr4701824plj.255.1501888746434;
 Fri, 04 Aug 2017 16:19:06 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g1sm4976817pfk.92.2017.08.04.16.19.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 04 Aug 2017 16:19:05 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Fri,  4 Aug 2017 16:18:51 -0700
Message-Id: <20170804231854.19730-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.0.rc1.383.gd1ce394fe2-goog
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
X-List-Received-Date: Fri, 04 Aug 2017 23:19:10 -0000
X-List-Received-Date: Fri, 04 Aug 2017 23:19:10 -0000

This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
same semantics as IPMI Block Transfer except it done over I2C.

The documentation discusses the reason for this in greater detail, suffice it to
say SSIF cannot be correctly implemented on some naive I2C devices. There are
some additional reasons why we don't like SSIF, but those are again covered in
the documentation for all those who are interested.

In addition, since I am adding both host side and BMC side support, I figured
that now is a good time to resolve the problem of where to put BMC side IPMI
drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
rest of the host side IPMI drivers, but I think it makes sense to put all of the
host side IPMI drivers in one directory and all of the BMC side drivers in
another, preferably in a way that does not effect all of the current OpenIPMI
users. I have not created a MAINTAINERS entry for the new directory yet, as I
figured there might be some discussion to be had about it.

I have tested this patchset on the Aspeed 2500 EVB.
