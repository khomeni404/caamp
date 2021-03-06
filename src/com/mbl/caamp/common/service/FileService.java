package com.mbl.caamp.common.service;

import com.mbl.caamp.common.bean.DocumentBean;
import com.mbl.caamp.common.model.Document;
import net.softengine.util.ActionResult;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Khomeni
 *         Created on : 15-Jan-18 at 10:19 AM
 */


public interface FileService {

    ActionResult writeAndSaveDocument(DocumentBean documentBean);

    ActionResult writeDocument(Document doc, MultipartFile mpf, boolean deleteOldDoc);
}
