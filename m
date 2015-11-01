Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EDA401A09AC
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:14:41 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340476401209.5313779476504;
 Sat, 31 Oct 2015 18:14:36 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Remove ipmi fru support from libapphandler
Date: Sat, 31 Oct 2015 20:14:33 -0500
Message-Id: <1446340473-8915-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446340473-8915-1-git-send-email-patches@stwcx.xyz>
References: <1446340473-8915-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:14:42 -0000

From: Chris Austen <austenc@us.ibm.com>

The new code will come from a different repo
---
 storagehandler.C | 69 --------------------------------------------------------
 storagehandler.h |  1 -
 2 files changed, 70 deletions(-)

diff --git a/storagehandler.C b/storagehandler.C
index 359e53f..aa80730 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -64,72 +64,6 @@ ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-struct write_fru_data_t {
-    uint8_t  frunum;
-    uint8_t  offsetls;
-    uint8_t  offsetms;
-    uint8_t  data;
-} __attribute__ ((packed)) ;
-
-ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
-                              ipmi_request_t request, ipmi_response_t response,
-                              ipmi_data_len_t data_len, ipmi_context_t context)
-{
-    write_fru_data_t *reqptr = (write_fru_data_t*) request;
-    FILE *fp;
-    char string[16];
-    short offset = 0;
-    uint16_t rlen;
-    ipmi_ret_t rc = IPMI_CC_OK;
-    char iocmd[4];
-
-    sprintf(string, "%s%02x", "/tmp/fru", reqptr->frunum);
-
-    offset = ((uint16_t)reqptr->offsetms) << 8 | reqptr->offsetls;
-
-
-    // Length is the number of request bytes minus the header itself.
-    // The header contains an extra byte to indicate the start of
-    // the data (so didn't need to worry about word/byte boundaries)
-    // hence the -1...
-    rlen = ((uint16_t)*data_len) - (sizeof(write_fru_data_t)-1);
-
-
-    printf("IPMI WRITE-FRU-DATA for %s  Offset = %d Length = %d\n",
-        string, offset, rlen);
-
-
-    // I was thinking "ab+" but it appears it doesn't
-    // do what fseek asks.  Modify to rb+ and fseek
-    // works great...
-    if (offset == 0) {
-        strcpy(iocmd, "wb");
-    } else {
-        strcpy(iocmd, "rb+");
-    }
-
-    if ((fp = fopen(string, iocmd)) != NULL) {
-        fseek(fp, offset, SEEK_SET);
-        fwrite(&reqptr->data,rlen,1,fp);
-        fclose(fp);
-    } else {
-        fprintf(stderr, "Error trying to write to fru file %s\n",string);
-        ipmi_ret_t rc = IPMI_CC_INVALID;
-    }
-
-
-    // TODO : Here is where some validation code could determine if the
-    // fru data is a legitimate FRU record (not just a partial).  Once
-    // the record is valid the code should call a parser routine to call
-    // the various methods updating interesting properties.  Perhaps
-    // thinigs like Model#, Serial#, DIMM Size, etc
-
-
-    *data_len = 0;
-
-    return rc;
-}
-
 ipmi_ret_t ipmi_storage_get_sel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -211,9 +145,6 @@ void register_netfn_storage_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME);
     ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME, NULL, ipmi_storage_set_sel_time);
 
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
-
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO);
     ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO, NULL, ipmi_storage_get_sel_info);
 
diff --git a/storagehandler.h b/storagehandler.h
index 7abefd5..174da06 100644
--- a/storagehandler.h
+++ b/storagehandler.h
@@ -5,7 +5,6 @@
 enum ipmi_netfn_storage_cmds
 {
     // Get capability bits
-    IPMI_CMD_WRITE_FRU_DATA = 0x12,
     IPMI_CMD_GET_SEL_INFO   = 0x40,
     IPMI_CMD_RESERVE_SEL    = 0x42,
     IPMI_CMD_ADD_SEL        = 0x44,
-- 
2.6.0
