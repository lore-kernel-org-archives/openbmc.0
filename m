Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznht5FqczDvWT
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=H5J+5G4u; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id k64so3168300itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j+3xhbcYOIoke3JOeA3tNgIFe9+YF9JI2G2AS1iaH6s=;
 b=H5J+5G4ufRkEg7kj0SSWnaflDRejT4UzeQHduBFZnQIdjzU4xTjTn55HGEpm1qRysD
 LfUg+sAZgKTtWFdtZBrcKHB3hzB2CgIvPZls8L7Dgswc9ZchBkAQOeRf8pyaw68ZBcrR
 UzzOTHLfb6FZuuWWLRK/E+Oha2KhiBKEZdeaJEBpxybtH8fdCQ5b+LB9Nw8Bpc1Ls4nP
 k2EcNs5HIIJ74n8d3GOTdgryb3OBSLIqwh9nKMt4fHGFm3gIR/Dmpf/cUhlavPVi138o
 aoI68rDBzbgB85G6zUCSPmItHHAdPuxN0tvs505NEaIu64z45mUhnO7MsqqWi+s5//yo
 ZOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j+3xhbcYOIoke3JOeA3tNgIFe9+YF9JI2G2AS1iaH6s=;
 b=eNQ0NAZwOSvc0K7GW3ohPlKuCLxE0Fyq5IHgbxDRCMdkPeXNFRy5RtL64TXMvBQFYZ
 dmmjoLQih+g5cr7mkppFhubT2N3XMLRRwOyYmB9aKdUo2H1rQxi3817FzxrYXtRemXKf
 1+JlUw0USlQsNra9YWDKJTNhw0fYQQpo1XDcFK5M7ADR2ovuJHiMB1iZkefPi67cXQwA
 Uptmow34ksGO60fldH8DFT9+kY5ZKbdEcythWgIyWFJWyI0qvxjY+83Q5sYb5WP5kI+1
 lc2ApMizdLtACiFuE6bvl6zIEwa6aNv4uZdZ8NlKr+y+WYLaXpDKG7rQRgUgMPOI/zwf
 HjsQ==
X-Gm-Message-State: AA6/9RnCrOeFo4PFBjtejdpLW4RHDrm6pdwMMRPEq5APjoXJeEuHBobS1x9EMKrn5YW9jQ==
X-Received: by 10.157.57.136 with SMTP id y8mr4347123otb.73.1476918604699;
 Wed, 19 Oct 2016 16:10:04 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.10.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:10:04 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 18/18] Documenation: Add basic FSI text file
Date: Wed, 19 Oct 2016 18:09:46 -0500
Message-Id: <1476918586-13475-19-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:07 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add documentation explaining the basics of FSI and how to find
more information.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 Documentation/fsi.txt | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/fsi.txt

diff --git a/Documentation/fsi.txt b/Documentation/fsi.txt
new file mode 100644
index 0000000..b8c94a0
--- /dev/null
+++ b/Documentation/fsi.txt
@@ -0,0 +1,36 @@
+The Flexible Support Interface (FSI) is a two wire bus consisting of
+a serial data line and a clock capable of running at up to 166 MHz.
+FSI features strong data integrity with CRC protection and is capable
+of very high fan out.
+
+The complete hardware specification[1] for FSI is publicly available on
+the OpenPower Foundation website:
+
+[1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html
+
+Common FSI terminology:
+
+* Master
+    Controller of the FSI bus.  Only the master is allowed to control the
+    clock line and is the initiator of all transactions on a bus.
+
+* Slave
+    The receiver or target of a master initiated transaction.  The slave
+    cannot initiate communications on a bus and must respond to any
+    master requests for data.
+
+* CFAM
+    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
+    ASIC residing in any device requiring FSI communications. CFAMs
+    consist of an array of hardware 'engines' used for various purposes.
+    I2C masters, UARTs, General Purpose IO hardware are common types of
+    these engines.
+
+* Configuration Space / Configuration Table
+    A table contained at the beginning of each CFAM address space.
+    This table lists information such as the CFAM's ID, which engine types
+    and versions it contains, as well as its addressing range.
+
+* FSI Client driver
+    A device driver that registers with the FSI core so that it can access
+    devices it owns on an FSI bus.
-- 
1.8.2.2
