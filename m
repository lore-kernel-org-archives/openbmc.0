Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BD8011A007F
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 12:30:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454290232347388.1803297752085;
 Sun, 31 Jan 2016 17:30:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server v2 0/2] The streaming support for
 obmc-rest.
Date: Sun, 31 Jan 2016 19:30:29 -0600
Message-Id: <1454290231-5656-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Feb 2016 01:30:37 -0000

Changes:
1) The main idea of this change is to have a streaming path as below:
    dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notify the client of the signal receiving.
2) Replace rocket with gevent WSGI server to support multiple async accesses.
3) Use gevent queue to notify the dbus signal receiving.
4) The uri to the streaming should be in the form as below:
    https://<ip>/<path>/stream/<signal_name>

https://github.com/openbmc/phosphor-rest-server/pull/15

shgoupf (2):
  The streaming support for obmc-rest.
  Convert all tabs to 4 spaces.

 obmc-rest | 1483 ++++++++++++++++++++++++++++++++-----------------------------
 1 file changed, 788 insertions(+), 695 deletions(-)
 mode change 100644 => 100755 obmc-rest

-- 
2.6.4
