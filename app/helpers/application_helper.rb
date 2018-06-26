module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def legend_name(title)
    %Q(
     <section class="content-header">
       <h1>#{title}</h1>
       <ol class="breadcrumb">
         <li><a href="/admin"><i class="fa fa-dashboard"></i> 主页</a></li>
       </ol>
    </section>
    ).html_safe
  end

  def status_style(status)
    case status.to_sym
    when :error
      "danger"
    else
      status
    end
  end

  def status_text(status)
    case status.to_sym
    when :error
      "操作失败"
    when :success
      "操作成功"
    else
      nil
    end
  end

  def status_icon(status)
    case status.to_sym
    when :alert
      " fa-info"
    when :error
      "fa-ban"
    when :success
      "fa-check"
    when :warning
      "fa-warning"
    else
      nil
    end
  end
end
